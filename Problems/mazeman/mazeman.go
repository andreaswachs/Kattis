package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"runtime/debug"
	"strconv"
	"strings"
)

var (
	reader            *bufio.Reader
	rows              int
	cols              int
	dotCount          int
	grid              [][]Node
	visitedGrid       [][]bool
	visitedPosToReset []Position
	queue             *ConstantQueue
)

type NodeType int

const (
	EntranceTile NodeType = iota
	EmptyTile
	WallTile
	DotTile
)

type Position struct {
	row, col int
}

type Node struct {
	Position Position
	Type     NodeType
}

type ConstantQueue struct {
	head  int
	tail  int
	items [10000]Position
	size  int
}

type Result struct {
	EntrancesUsed   int
	UnreachableDots int
}

func newNode(row, col int, char rune) *Node {
	var nodeType NodeType

	switch char {
	case 'X':
		nodeType = WallTile
	case '.':
		nodeType = DotTile
	case ' ':
		nodeType = EmptyTile
	default:
		nodeType = EntranceTile
	}

	return &Node{Type: nodeType, Position: Position{row: row, col: col}}
}

func (n *Node) isEntrance() bool {
	return n.Type == EntranceTile
}

func (n *Node) isDot() bool {
	return n.Type == DotTile
}

func (n *Node) canMoveTo() bool {
	return n.Type != WallTile && n.Type != EntranceTile
}

func NewConstantQueue(size int) *ConstantQueue {
	if size == 0 {
		panic("Queue size cannot be 0")
	}

	return &ConstantQueue{items: [10000]Position{}, size: size}
}

func (q *ConstantQueue) Enqueue(p Position) {
	q.items[q.tail] = p
	q.tail = (q.tail + 1) % q.size
}

func (q *ConstantQueue) Dequeue() Position {
	p := q.items[q.head]
	q.head = (q.head + 1) % q.size
	return p
}

func (q *ConstantQueue) IsEmpty() bool {
	return q.head == q.tail
}

func (q *ConstantQueue) Reset() {
	q.head = 0
	q.tail = 0
}

func generateEntrancePowerset(entrances []Position) [][]Position {
	// Implementing an algorithm for generating powersets in an iterative way
	powerset := make([][]Position, 0, int(math.Pow(2, float64((len(entrances))-1))))
	powerset = append(powerset, []Position{})

	for _, e := range entrances {
		for _, subset := range powerset {
			newSubset := make([]Position, len(subset))
			copy(newSubset, subset)
			newSubset = append(newSubset, e)
			powerset = append(powerset, newSubset)
		}
	}

	return powerset
}

func markVisited(pos *Position) {
	visitedGrid[pos.row][pos.col] = true
	visitedPosToReset = append(visitedPosToReset, *pos)
}

func resetVisited() {
	for _, pos := range visitedPosToReset {
		visitedGrid[pos.row][pos.col] = false
	}

	visitedPosToReset = visitedPosToReset[:0]
}

func init() {
	debug.SetGCPercent(-1)
	reader = bufio.NewReader(os.Stdin)
}

func main() {
	// Solution goes here
	ints := readInts()
	rows = ints[0]
	cols = ints[1]

	entrances := make([]Position, 0, 100+100+98+98)

	queue = NewConstantQueue(rows * cols)

	grid := make([][]Node, rows)
	visitedGrid = make([][]bool, rows)
	for row := 0; row < rows; row++ {
		// Prepare the grids
		grid[row] = make([]Node, 0, cols)
		visitedGrid[row] = make([]bool, cols, cols)

		// Read data into the current grid row
		line := readLine()
		for col, char := range line {
			theNode := newNode(row, col, char)
			grid[row] = append(grid[row], *theNode)

			if theNode.isEntrance() {
				entrances = append(entrances, theNode.Position)
			} else if theNode.isDot() {
				dotCount++
			}
		}
	}

	if dotCount == 0 {
		fmt.Printf("%d %d\n", 0, 0)
		os.Exit(0)
	}

	totalDotsFound := 0
	entrancesUsed := 0

	for _, entrance := range entrances {
		queue.Enqueue(entrance)
		dotsFound := 0

		for !queue.IsEmpty() {
			pos := queue.Dequeue()

			if visitedGrid[pos.row][pos.col] {
				continue
			}

			markVisited(&pos)

			if grid[pos.row][pos.col].isDot() {
				dotsFound++
			}

			// Check if we can move up
			if pos.row-1 >= 0 && grid[pos.row-1][pos.col].canMoveTo() {
				queue.Enqueue(Position{row: pos.row - 1, col: pos.col})
			}

			// Check if we can move down
			if pos.row+1 < rows && grid[pos.row+1][pos.col].canMoveTo() {
				queue.Enqueue(Position{row: pos.row + 1, col: pos.col})
			}

			// Check if we can move left
			if pos.col-1 >= 0 && grid[pos.row][pos.col-1].canMoveTo() {
				queue.Enqueue(Position{row: pos.row, col: pos.col - 1})
			}

			// Check if we can move right
			if pos.col+1 < cols && grid[pos.row][pos.col+1].canMoveTo() {
				queue.Enqueue(Position{row: pos.row, col: pos.col + 1})
			}
		}

		if dotsFound > 0 {
			entrancesUsed++
		}

		totalDotsFound += dotsFound
	}

	fmt.Printf("%d %d\n", entrancesUsed, dotCount-totalDotsFound)

}

func readLine() string {
	line, err := reader.ReadString('\n')
	if err != nil {
		panic(err)
	}

	return line[:len(line)-1]
}

// readInt reads a single int from stdin
func readInt() int {
	var x int
	fmt.Scanf("%d", &x)
	return x
}

// readInts reads a line of space-separated ints from stdin
func readInts() []int {
	line := readLine()
	var xs []int

	for _, num := range strings.Split(line, " ") {
		n, err := strconv.Atoi(num)
		if err != nil {
			panic(err)
		}
		xs = append(xs, n)
	}

	return xs
}

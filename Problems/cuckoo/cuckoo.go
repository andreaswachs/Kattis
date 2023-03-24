package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

var (
	err    error         = nil
	reader *bufio.Reader = bufio.NewReader(os.Stdin)
)

type tuple struct {
	a int
	b int
}

func solve(table []int, history []tuple, words, size int) bool {
	evicted := make([]bool, size)

	for i := 0; i < words; i++ {

		if table[history[i].a] == -1 {
			// We can insert the word based on h1
			table[history[i].a] = i
		} else {
			// We try to insert the word based on h2
			if table[history[i].b] == -1 {
				table[history[i].b] = i
			} else {
				// The second space was also occupied, we need to evict it
				evicted[history[i].b] = true

				toEvict := table[history[i].b]
				table[history[i].b] = i

			}

		}

	}

	panic("not implemented")
}

func main() {
	cases := readInt()

	for i := 0; i < cases; i++ {
		ints := readInts()
		words := ints[0]
		size := ints[1]
		history := make([]tuple, words)

		for j := 0; j < words; j++ {
			hashPos := readInts()
			history = append(history, tuple{hashPos[0], hashPos[1]})
		}

		table := make([]int, size)
		for k := 0; k < size; k++ {
			table[k] = -1
		}

		if solve(table, history, words, size) {
			fmt.Println("rehash necessary")
		} else {
			fmt.Println("successful hashing")
		}
	}
}

func readWords() []string {
	line := readLine()
	return strings.Split(line, " ")
}

func readLine() string {
	line, _ := reader.ReadString('\n')
	return line[:len(line)-1]
}

// readInt reads a single int from stdin
func readInt() int {
	x, _ := strconv.Atoi(readLine())
	return x
}

// readInts reads a line of space-separated ints from stdin
func readInts() []int {
	line := readLine()
	var xs []int

	for _, num := range strings.Split(line, " ") {
		n, _ := strconv.Atoi(num)
		xs = append(xs, n)
	}

	return xs
}

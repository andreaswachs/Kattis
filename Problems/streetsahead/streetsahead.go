package main

import (
	"bufio"
	"fmt"
	"math"
	"os"
	"strconv"
	"strings"
)

var (
	err    error         = nil
	reader *bufio.Reader = bufio.NewReader(os.Stdin)
)

func main() {
	street := make(map[string]int)

	ints := readInts()

	n := ints[0]
	q := ints[1]

	for i := 0; i < n; i++ {
		streetName := readLine()
		street[streetName] = i
	}

	for i := 0; i < q; i++ {
		fromTo := readTokens()
		from := street[fromTo[0]]
		to := street[fromTo[1]]

		fmt.Printf("%d\n", int(math.Abs(float64(to-from)))-1)
	}

}

func readTokens() []string {
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

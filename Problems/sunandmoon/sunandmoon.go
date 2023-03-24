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

func main() {
	sunInts := readInts()
	sunElapsed := sunInts[0]
	sunPeriod := sunInts[1]

	moonInts := readInts()
	moonElapsed := moonInts[0]
	moonPeriod := moonInts[1]

	for i := 0; true; i++ {
		if sunElapsed == 0 && moonElapsed == 0 {
			fmt.Println(i)
			break
		}

		sunElapsed = (sunElapsed + 1) % sunPeriod
		moonElapsed = (moonElapsed + 1) % moonPeriod
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

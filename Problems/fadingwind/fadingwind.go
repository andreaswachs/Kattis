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
	ints := readInts()
	h := ints[0]
	k := ints[1]
	v := ints[2]
	s := ints[3]

	dist := 0

	for h > 0 {
		v += s

		v -= max(1, int(math.Floor(float64(v)/10)))

		if v >= k {
			h++
		} else if 0 < v && v < k {
			h--
			if h == 0 {
				v = 0
			}
		} else if v <= 0 {
			h = 0
			v = 0
		}

		dist += v

		if s > 0 {
			s--
		}
	}

	fmt.Println(dist)
}

func max(a, b int) int {
	if a < b {
		return b
	}
	return a
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

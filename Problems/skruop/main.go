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

func skruOp(volume *int) {
	if *volume < 10 {
		*volume++
	}
}

func skruNed(volume *int) {
	if *volume > 0 {
		*volume--
	}
}

func handleLine(line string, volume *int) {
	switch line {
	case "Skru op!":
		skruOp(volume)
	case "Skru ned!":
		skruNed(volume)
	}
}

func main() {
	volume := 7
	lines, _ := readLineAsInt()
	for i := 0; i < lines; i++ {
		handleLine(readLine(), &volume)
	}

	fmt.Println(volume)
}

func skipLine() {
	readLine()
}

func readLineManyInts() ([]int, error) {
	line := readLine()
	strs := strings.Split(string(line), " ")

	ints := make([]int, len(strs))

	for i, str := range strs {
		ints[i], err = strconv.Atoi(str)
		if err != nil {
			return nil, err
		}

	}

	return ints, err
}

func readLineAsInt() (int, error) {
	line := readLine()
	return strconv.Atoi(string(line))
}

func readLine() string {
	line, err := reader.ReadString('\n')
	// don't propagate the error, just crash
	if err != nil {
		panic(err)
	}
	return string(line[:len(line)-1])
}

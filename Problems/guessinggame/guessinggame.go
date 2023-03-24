package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

var (
	err         error         = nil
	reader      *bufio.Reader = bufio.NewReader(os.Stdin)
	gameResults []bool        = make([]bool, 0, 2500)
)

func play() {
	// Initialize variables for the binary search
	lo := 1
	hi := 10
	mid, _ := readLineAsInt()

loop:
	for lo <= hi {
		result := readLine()

		//check ot see if mid goes "out of bounds"
		switch result {
		case "too high":
			hi = mid
		case "too low":
			lo = mid
		case "right on":
			break loop
		case "EOF":
			return
		}

		mid, _ = readLineAsInt()
	}

	if mid < lo || mid > hi {
		gameResults = append(gameResults, false)
	} else {
		gameResults = append(gameResults, true)
	}

	play()
}

func main() {
	play()
	for _, result := range gameResults {
		if result {
			fmt.Println("Stan may be honest")
		} else {
			fmt.Println("Stan is dishonest")
		}
	}
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
	if err != nil {
		return "EOF"
	}
	return string(line[:len(line)-1])
}

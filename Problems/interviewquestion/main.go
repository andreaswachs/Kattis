package main

import (
	"bufio"
	"fmt"
	"os"
	"sort"
	"strconv"
	"strings"
)

func findSolution(d int, as []int) int {
	if len(as) == 0 {
		return d + 1
	}

	if len(as) == 1 {
		return as[0]
	}

	// case:2 numbers
	return as[1] - as[0]
}

func main() {
	reader := bufio.NewReader(os.Stdin)

	// Read in the variables c and d
	input, _ := reader.ReadString('\n')
	input = input[:len(input)-1]
	inputs := strings.Split(input, " ")
	c, _ := strconv.Atoi(inputs[0])
	d, _ := strconv.Atoi(inputs[1])

	// Read in the rest of the numbers
	input, _ = reader.ReadString('\n')
	input = input[:len(input)-1]
	inputs = strings.Split(input, " ")

	fizzes := make([]int, 0, 10)
	buzzes := make([]int, 0, 10)

	currentNum := c
	for _, input := range inputs {
		switch input {
		case "Fizz":
			fizzes = append(fizzes, currentNum)
		case "Buzz":
			buzzes = append(buzzes, currentNum)
		case "FizzBuzz":
			buzzes = append(buzzes, currentNum)
			fizzes = append(fizzes, currentNum)
		default:
		}

		currentNum += 1
	}

	sort.Ints(fizzes)
	sort.Ints(buzzes)

	a := findSolution(d, fizzes)
	b := findSolution(d, buzzes)

	fmt.Printf("%d %d", a, b)
}

package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"strings"
)

func main() {
	reader := bufio.NewReader(os.Stdin)
	input, _ := reader.ReadString('\n')

	input = strings.Trim(input, "\n")
	numbers := strings.Split(input, " ")

	a, _ := strconv.Atoi(numbers[0])
	b, _ := strconv.Atoi(numbers[1])

	fmt.Printf("%d", a+b)
}

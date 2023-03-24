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
	number, _ := strconv.Atoi(input)
	result := float64(number) / 4.0

	fmt.Printf("%.2f", result)
}

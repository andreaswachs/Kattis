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

	reader.ReadString('\n')
	input, _ := reader.ReadString('\n')
	input = input[:len(input)-1]

	numbers := strings.Split(input, " ")
	sum := 0
	for _, number := range numbers {
		n, _ := strconv.Atoi(number)
		sum += n
	}

	fmt.Println(sum)
}

package main

import (
	"fmt"
)

func main() {
	var javelins, javelin, lengthSum int
	fmt.Scanln(&javelins)

	for i := 0; i < javelins; i++ {
		fmt.Scanln(&javelin)
		lengthSum += javelin - 1
	}
	// undo the last length decrease
	lengthSum++

	fmt.Println(lengthSum)
}

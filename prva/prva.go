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

	text := readLine(reader)
	numbers := strings.Split(text, " ")

	R, _ := strconv.Atoi(numbers[0])
	C, _ := strconv.Atoi(numbers[1])

	cells := [][]string{}
	verticals := [][]string{}
	wordsSlice := []string{}

	// Make all the left-to-right words from the block
	for i := 0; i < R; i++ {
		currentLine := readLineAsCharArray(reader)
		cells = append(cells, currentLine)
	}

	// Make all the top-top-bottom words from the block
	for i := 0; i < C; i++ {
		column := []string{}
		for j := 0; j < R; j++ {
			column = append(column, cells[j][i])
		}
		verticals = append(verticals, column)
	}

	// Append it all to the cells to have all the possible words
	for _, word := range verticals {
		cells = append(cells, word)
	}

	minValue := int(^uint(0) >> 1) // maximum int
	minWord := ""
	valuesSlice := []int{}

	for _, letters := range cells {
		wordsBuffer := strings.Join(stringSliceToWords(letters), "")
		if len(wordsBuffer) > 0 {
			wordsSlice = append(wordsSlice, wordsBuffer)
			valuesSlice = append(valuesSlice, toLexValue(wordsBuffer))
		}
	}

	for _, word := range wordsSlice {

		value := toLexValue(word)
		if value < minValue {
			minValue = value
			minWord = word
		}
	}

	fmt.Println(minWord)
}

func toLexValue(name string) int {
	asRunes := []rune(name)
	sum := 0
	for _, value := range asRunes {
		sum += int(value)
	}

	return sum
}

func stringSliceToWords(letters []string) []string {
	wordBuffer, words := []string{}, []string{}

	for _, char := range letters {
		if char == "#" {
			if len(wordBuffer) < 2 {
				wordBuffer = []string{}
			} else {
				words = append(words, wordBuffer...)
			}
		} else {
			wordBuffer = append(wordBuffer, char)
		}
	}

	if len(wordBuffer) > 2 {
		words = append(words, wordBuffer...)
	}

	return words
}

func readLineAsCharArray(reader *bufio.Reader) []string {
	text := readLine(reader)
	return strings.Split(text, "")
}

func readLine(reader *bufio.Reader) string {
	text, _ := reader.ReadString('\n')
	text = strings.Replace(text, "\n", "", 1)
	return text
}

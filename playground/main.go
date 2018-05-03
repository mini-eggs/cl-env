package main

import (
	"C"
)

//export GetHelloWorldFromGo
func GetHelloWorldFromGo() string {
	return "Hello, World"
}

func main() {}

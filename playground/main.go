// DONT PAY ATTENTION
// THIS FILE IS FULL OF TESTS
// FOR THE MOMENT

package main

import (
	"C"

	"github.com/mini-eggs/direnv"
)
import (
	"fmt"
	"os"
)

//export DirenvProxy
func DirenvProxy(dir string) {
	e := make(direnv.Env)
	e[direnv.DIRENV_CONFIG] = "/home/evan/.config/direnv"
	e[direnv.DIRENV_BASH] = "/bin/bash"
	os.Args[0] = "direnv"

	err1 := direnv.CmdAllow.Fn(e, []string{"/home/evan/quicklisp/local-projects/cl-env/playground/", "cffi"})
	if err1 != nil {
		fmt.Printf("\n1: %+v\n", err1)
		return
	}

	err2 := direnv.CmdExport.Fn(e, []string{"/home/evan/quicklisp/local-projects/cl-env/playground/.envrc", "cffi"})
	if err2 != nil {
		fmt.Printf("\n2: %+v\n", err2)
		return
	}
}

func main() {
	DirenvProxy(".")
}

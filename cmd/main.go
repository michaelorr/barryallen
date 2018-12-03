package main

import "fmt"
import "net/http"

func main() {
	http.HandleFunc("/", func (w http.ResponseWriter, r *http.Request) {
		fmt.Fprintf(w, "Hello, world")
	})
	http.ListenAndServe("0.0.0.0:80", nil)
}

package main

import (
	"fmt"
	"net/http"
)

func handler(w http.ResponseWriter, r *http.Request) {
	fmt.Fprintf(w, "Hello world\n")
}

func main() {
	fmt.Println("Starting server")
	http.HandleFunc("/", handler)
	http.ListenAndServe(":8080", nil)
}

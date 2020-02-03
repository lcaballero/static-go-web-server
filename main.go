package main // import "static-go-web-server/web"

import (
	"fmt"
	"log"
	"net/http"
)

func main() {
	fs := http.FileServer(http.Dir("static"))
	http.Handle("/", fs)

	ip := "0.0.0.0"
	port := 3000
	bind := fmt.Sprintf("%s:%d", ip, port)

	log.Printf("binding server to %s\n", bind)
	http.ListenAndServe(":3000", nil)
}

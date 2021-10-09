package main

import (
	"sync"
	"vtbhahaton/server"
)

func main() {
	wg := sync.WaitGroup{}
	s := server.New("localhost:8080")
	wg.Add(1)
	go func() {
		s.Run()
	}()
	wg.Wait()
}

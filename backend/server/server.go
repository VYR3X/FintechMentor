package server

import (
	"fmt"
	"github.com/gorilla/mux"
	"log"
	"net/http"
	"vtbhahaton/pkg/handlers"
	"vtbhahaton/pkg/static"
)

type HTTPServer struct {
	r    *mux.Router
	addr string
}

func New(addr string) HTTPServer {
	return HTTPServer{
		r:    mux.NewRouter(),
		addr: addr,
	}
}

func (h *HTTPServer) Run() {
	h.r.HandleFunc("/healthcheck/", func(w http.ResponseWriter, r *http.Request) {
		fmt.Fprint(w, "alive")
	})
	getRouter := h.r.Methods(http.MethodGet).Subrouter().StrictSlash(true)
	getRouter.HandleFunc("/intro/", func(w http.ResponseWriter, r *http.Request) {
		handlers.HandleTest(w, r, static.GetIntroResponse())
	})
	getRouter.HandleFunc("/test1/", func(w http.ResponseWriter, r *http.Request) {
		handlers.HandleTest(w, r, static.GetTest1Response())
	})
	getRouter.HandleFunc("/test2/", func(w http.ResponseWriter, r *http.Request) {
		handlers.HandleTest(w, r, static.GetTest2Response())
	})
	getRouter.HandleFunc("/info1/", func(w http.ResponseWriter, r *http.Request) {
		handlers.HandleInfo(w, r, static.GetInfo1Response())
	})
	getRouter.HandleFunc("/info2/", func(w http.ResponseWriter, r *http.Request) {
		handlers.HandleInfo(w, r, static.GetInfo2Response())
	})
	postRouter := h.r.Methods(http.MethodPost).Subrouter().StrictSlash(true)
	postRouter.Handle("/card/", http.HandlerFunc(handlers.HandleCardsRequest))
	if err := http.ListenAndServe(h.addr, h.r); err != nil {
		log.Fatal(err, "pzdc")
	}
}

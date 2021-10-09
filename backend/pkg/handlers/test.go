package handlers

import (
	"encoding/json"
	"log"
	"net/http"
	"vtbhahaton/pkg/models"
)

func HandleTest(w http.ResponseWriter, r *http.Request, data models.TestResponse) {
	resp, err := json.Marshal(data)
	if err != nil {
		log.Println("cant marshall static test")
	}
	w.Write(resp)
}

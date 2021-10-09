package handlers

import (
	"encoding/json"
	"log"
	"net/http"
	"vtbhahaton/pkg/models"
)

func HandleInfo(w http.ResponseWriter, r *http.Request, data models.InfoResponse) {
	resp, err := json.Marshal(data)
	if err != nil {
		log.Println("cant marshall static info")
	}
	w.Write(resp)
}

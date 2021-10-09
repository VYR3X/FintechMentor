package handlers

import (
	"encoding/json"
	"log"
	"math/rand"
	"net/http"
	"time"
	"vtbhahaton/pkg/db"
	"vtbhahaton/pkg/models"
	"vtbhahaton/pkg/static"
)

func HandleCardsRequest(w http.ResponseWriter, r *http.Request) {
	var req models.CardRequest

	err := json.NewDecoder(r.Body).Decode(&req)
	if err != nil {
		http.Error(w, err.Error(), http.StatusBadRequest)
		return
	}
	log.Println("got request:", req.UserID, req.LastAnswer)

	// get user or create
	user := db.DBInstance.SetUser(db.UserID(req.UserID))
	log.Printf("%v\n", user)

	user = checkAnswer(&user, req.LastAnswer)

	// do card transition
	user, gotCard := doTransition(user)
	log.Println("want: ", user.GetWantAnswer())

	// save changes
	db.DBInstance[user.GetUserID()] = user

	//add balance to response
	gotCard.Balance = user.GetBalance()
	log.Println("balance to response:", user.GetBalance())

	// return card
	resp, err := json.Marshal(gotCard)
	if err != nil {
		log.Println("couldn't marshall card")
	}

	w.Header().Set("Content-Type", "application/json")
	w.Write(resp)
}

const threshold = 5000

func doTransition(user db.UserInfo) (u db.UserInfo, c models.Card) {
	cardset := user.GetCardSet()
	if len(cardset) == 0 {
		if user.GetBalance() < threshold && user.GetStages().Current() == static.TEST4 {
			c = static.GetRandomCard()
			user.SetWantAnswer(c.TrueAnswer)
			return user, c
		}

		err := user.GetStages().Next(user.GetStages().Current())
		if err != nil {
			log.Fatal(err)
		}
		cardset = static.GetCardsSet(user.GetStages().Current())
		c, cardset = cardset[0], cardset[1:]

		user.SetWantAnswer(c.TrueAnswer)
		user.SetCardSet(cardset)

		return user, c
	}
	rand.Seed(rand.Int63n(time.Now().Unix()))

	if rand.Intn(100) > 75 {
		c = static.GetFinancialCard()
		user.SetWantAnswer(c.TrueAnswer)
		return user, c
	}
	if user.NeedsRestore() {
		c = static.GetSpecialRestorationCard()
		user.SetWantAnswer(c.TrueAnswer)
		return user, c
	}
	if rand.Intn(100) > 50 {
		c = static.GetAdvertisment()
		user.SetWantAnswer(c.TrueAnswer)
		return user, c
	}
	if rand.Intn(100) > 50 {
		c = static.GetShare()
		user.SetWantAnswer(c.TrueAnswer)
		return user, c
	}

	c, cardset = cardset[0], cardset[1:]

	user.SetWantAnswer(c.TrueAnswer)
	user.SetCardSet(cardset)

	return user, c
}

func checkAnswer(user *db.UserInfo, got string) db.UserInfo {
	if user.CorrectAnswer(got) {
		user.AddBalance(300)
		log.Println("will add")
	}
	return *user
}

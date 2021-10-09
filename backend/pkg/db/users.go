package db

import (
	"vtbhahaton/pkg/fsm"
	"vtbhahaton/pkg/models"
)

type UserID string

type UsersDB map[UserID]UserInfo

var DBInstance = UsersDB{}

type UserInfo struct {
	userID      UserID
	stages      *fsm.StepMachine
	balance     uint
	risk        int
	cardSet     []models.Card
	wantAnswer  string
	wrongStream int
}

func (u *UsersDB) SetUser(id UserID) UserInfo {
	if _, ok := DBInstance[id]; ok {
		return DBInstance[id]
	}
	DBInstance[id] = UserInfo{
		userID:     id,
		stages:     fsm.NewStepMachine(),
		balance:    1000,
		risk:       0,
		cardSet:    nil,
		wantAnswer: "",
	}
	return DBInstance[id]
}

func (u *UserInfo) GetUserID() UserID {
	return u.userID
}

func (u *UserInfo) GetStages() *fsm.StepMachine {
	return u.stages
}
func (u *UserInfo) SetStages(s *fsm.StepMachine) {
	u.stages = s
}

func (u *UserInfo) GetCardSet() []models.Card {
	return u.cardSet
}

func (u *UserInfo) SetCardSet(set []models.Card) {
	u.cardSet = set
}

func (u *UserInfo) CorrectAnswer(got string) bool {
	return got == u.wantAnswer || got == "" || u.wantAnswer == ""
}

func (u *UserInfo) NeedsRestore() bool {
	return u.wrongStream >= 3
}

func (u *UserInfo) GetBalance() uint {
	return u.balance
}

func (u *UserInfo) SetWantAnswer(want string) {
	u.wantAnswer = want
}

func (u *UserInfo) AddBalance(add uint) {
	u.balance += add
}
func (u *UserInfo) GetWantAnswer() string {
	return u.wantAnswer
}

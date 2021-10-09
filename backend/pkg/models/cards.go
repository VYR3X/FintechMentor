package models

type Card struct {
	Type       string `json:"type"`
	Header     string `json:"header"`
	Text       string `json:"text"`
	TrueAnswer string `json:"-"`
	Character  string `json:"character,omitempty"`
	Balance    uint   `json:"balance"`
	Values     []int  `json:"values"`
	Link       string `json:"link,omitempty"`
}

type CardRequest struct {
	LastAnswer string `json:"last_answer"`
	UserID     string `json:"user_id"`
}

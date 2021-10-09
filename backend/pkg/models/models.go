package models

type TestResponse struct {
	TestList []Test `json:"test_list"`
}

type Test struct {
	Text         string   `json:"text"`
	Options      []string `json:"options"`
	Dots         []int    `json:"dots,omitempty"`
	PicURL       string   `json:"pic_url,omitempty"`
	Right        string   `json:"right"`
	ExplainRight string   `json:"explain_right"`
	ExplainWrong string   `json:"explain_wrong"`
}

type InfoResponse struct {
	InfoList []Info `json:"info_list"`
}

type Info struct {
	Header string `json:"header"`
	Image  string `json:"image"`
	Text   string `json:"text"`
}

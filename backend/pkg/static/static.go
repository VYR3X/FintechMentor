package static

import "vtbhahaton/pkg/models"

func GetIntroResponse() models.TestResponse {
	return models.TestResponse{
		TestList: []models.Test{
			{
				Text:         "Эппл взорвали террористы",
				Options:      []string{"Купить", "Продать", "Держать"},
				Dots:         []int{35, 25, 11, 0, 0, 0, 0, 0, 0, 0, 0, 0},
				Right:        "Продать",
				ExplainRight: "все верно",
				ExplainWrong: "все плохо абоба",
			},
			{
				Text:         "Гугл взорвали террористы",
				Options:      []string{"Купить", "Продать", "Держать"},
				Dots:         []int{15, 18, 22, 21, 10, 5, 3, 0, 0, 0, 0, 0},
				Right:        "Продать",
				ExplainRight: "все верно гугл",
				ExplainWrong: "все плохо гугол",
			},
			{
				Text:         "Сбер купил Яндекс",
				Options:      []string{"Купить", "Продать", "Держать"},
				Dots:         []int{11, 15, 18, 34, 57, 58, 58, 59, 61, 63, 66, 69},
				Right:        "Купить",
				ExplainRight: "все верно яндыкс",
				ExplainWrong: "все плохо яндыкс",
			},
		},
	}
}

func GetInfo1Response() models.InfoResponse {
	return models.InfoResponse{
		InfoList: []models.Info{
			{
				Header: "Абоба",
				Image:  "https://memepedia.ru/wp-content/uploads/2021/02/aboba-glad-valakas.jpg",
				Text:   "Абоба Абоба Абоба Абоба",
			},
			{
				Header: "Амогус",
				Image:  "https://i1.sndcdn.com/artworks-R94iOc6sAtrwyUww-V34VOA-t500x500.jpg",
				Text:   "Амогус Амогус Амогус",
			},
			{
				Header: "Ахаххаха",
				Image:  "https://forum.taucetistation.org/uploads/default/original/3X/1/d/1d6b560db0cbeb90a03ecd7080b3cc9c0ad8c9f7.jpeg",
				Text:   "АхаххахаАхаххаха",
			},
		},
	}
}

func GetInfo2Response() models.InfoResponse {
	return models.InfoResponse{
		InfoList: []models.Info{
			{
				Header: "негр",
				Image:  "https://memepedia.ru/wp-content/uploads/2017/09/1a5.jpg",
				Text:   "негр",
			},
			{
				Header: "аыаывавыа",
				Image:  "https://memepedia.ru/wp-content/uploads/2017/09/1a5.jpg",
				Text:   "Аываыва",
			},
			{
				Header: "434324324",
				Image:  "https://memepedia.ru/wp-content/uploads/2017/09/1a5.jpg",
				Text:   "чмсмсмчмсчмавыва",
			},
		},
	}
}
func GetTest1Response() models.TestResponse {
	return models.TestResponse{
		TestList: []models.Test{
			{
				Text:         "Эпы ваааа выаыв",
				Options:      []string{"Купить", "Продать", "Держать"},
				PicURL:       "https://clideo.com/assets/images/meme-templates/meme-demo-template-7-lg.png",
				Right:        "Продать",
				ExplainRight: "аыва все йцуйц норм",
				ExplainWrong: "аа все плохо",
			},
		},
	}
}
func GetTest2Response() models.TestResponse {
	return models.TestResponse{
		TestList: []models.Test{
			{
				Text:         "Эыфвфывы",
				Options:      []string{"Купить", "Продать", "Держать"},
				PicURL:       "https://cs8.pikabu.ru/post_img/2016/01/30/7/1454149144168657134.jpg",
				Right:        "Продать",
				ExplainRight: "все верноыыы",
				ExplainWrong: "все плохо ыыы",
			},
		},
	}
}

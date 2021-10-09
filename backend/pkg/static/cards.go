package static

import (
	"math/rand"
	"vtbhahaton/pkg/models"
)

const (
	RANDOM string = "RANDOM"

	INFO1 string = "INFO1"
	INFO2 string = "INFO2"

	TUTORIAL1 string = "TUTORIAL1"
	TUTORIAL2 string = "TUTORIAL2"
	TUTORIAL3 string = "TUTORIAL3"
	TUTORIAL4 string = "TUTORIAL4"
	TUTORIAL5 string = "TUTORIAL5"
	TUTORIAL6 string = "TUTORIAL6"
	TUTORIAL7 string = "TUTORIAL7"
	TUTORIAL8 string = "TUTORIAL8"

	TEST1 string = "TEST1"
	TEST2 string = "TEST2"
	TEST3 string = "TEST3"
	TEST4 string = "TEST4"
	TEST5 string = "TEST5"
	TEST6 string = "TEST6"
	TEST7 string = "TEST7"
	TEST8 string = "TEST8"
)
const (
	typeSituation = "situation"
	typeTutorial  = "tutorial"
)

type StageCards struct {
	stage string
	cards []models.Card
}

func GetCardsSet(stage string) []models.Card {
	switch stage {
	case INFO1:
		return []models.Card{
			{
				Header:     "INFO1",
				Text:       "Трейды в течение дня. Здесь ты научишься делать три четыре пять один восемь. Три три три три. Удачи!",
				TrueAnswer: "",
				Values:     generateArray(),
			},
		}
	case INFO2:
		return []models.Card{
			{
				Header:     "INFO2",
				Text:       "Инвестиции в опционы и так далее. Этот блок научит тебя делать бочку и пинать инвестиции. Вперед!",
				TrueAnswer: "",
				Values:     generateArray(),
			},
		}
	case TUTORIAL1:
		return []models.Card{
			{
				Header:     TUTORIAL1,
				Text:       "Я тебе так скажу, акции нужно покупать по выгодной цене чтобы продать. Понял? Я не сомневался.",
				TrueAnswer: "",
				Character:  "tutor1",
				Values:     generateArray(),
			},
		}
	case TUTORIAL2:
		return []models.Card{
			{
				Header:     TUTORIAL2,
				Text:       "Во вторых надо деньги поднимать. Следить за рынком и все такое бла бла бла",
				TrueAnswer: "",
				Character:  "tutor1",
				Values:     generateArray(),
			},
		}
	case TUTORIAL3:
		return []models.Card{
			{
				Header:     TUTORIAL3,
				Text:       "Возможная доходность ценных бумаг выше, чем у вкладов. Широкий выбор инструментов: от низкорисковых с умеренной доходностью до высокорисковых с возможным высоким доходом. Государство позволяет снизить или вовсе не платить налоги на доход с инвестиций — для этого существует специальный счёт (ИИС).",
				TrueAnswer: "",
				Character:  "tutor1",
				Values:     generateArray(),
			},
		}
	case TUTORIAL4:
		return []models.Card{
			{
				Header:     TUTORIAL4,
				Text:       "Доходность не гарантирована — можно уйти в минус, особенно если инвестировать в бумаги с высоким риском.",
				TrueAnswer: "",
				Character:  "tutor1",
				Values:     generateArray(),
			},
		}
	case TUTORIAL5:
		return []models.Card{
			{
				Header:     TUTORIAL5,
				Text:       "Если регулярно откладывать и инвестировать деньги, можно создать капитал, который будет приносить пассивный доход в виде купонов или дивидендов.",
				TrueAnswer: "",
				Character:  "tutor2",
				Values:     generateArray(),
			},
		}
	case TUTORIAL6:
		return []models.Card{
			{
				Header:     "Накопить на крупную покупку",
				Text:       "Ценные бумаги могут приносить доход выше вкладов, поэтому вложения в них — один из способов накопить на жильё, обучение ребёнка или другую цель.",
				TrueAnswer: "",
				Character:  "tutor2",
				Values:     generateArray(),
			},
		}
	case TUTORIAL7:
		return []models.Card{
			{
				Header:     "Обеспечить комфортную жизнь на пенсии",
				Text:       "Чтобы в пожилом возрасте не менять привычный образ жизни, позаботьтесь о своём будущем уже сегодня с помощью долгосрочных инвестиций.",
				TrueAnswer: "",
				Character:  "tutor2",
				Values:     generateArray(),
			},
		}
	case TUTORIAL8:
		return []models.Card{
			{
				Header:     "Инвестором может быть каждый",
				Text:       "Большинство реальных инвесторов — обычные люди: они ходят на работу, растят детей и увлекаются не только финансами. Для них инвестиции — это просто ещё один источник дохода и способ обеспечить себе комфортную старость на пенсии.",
				TrueAnswer: "",
				Character:  "tutor2",
				Values:     generateArray(),
			},
		}
	case TEST1:
		return []models.Card{
			{
				Header:     "Nor again i",
				Text:       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut ",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
			{
				Header:     "Nor again i",
				Text:       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut ",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
		}
	case TEST2:
		return []models.Card{
			{
				Header:     "ea commodi consequatur",
				Text:       "n voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
			{
				Header:     "Nor again i",
				Text:       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut ",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
		}
	case TEST3:
		return []models.Card{
			{
				Header:     "luptatem sequi nesciunt",
				Text:       "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
			{
				Header:     "Nor again i",
				Text:       "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut ",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
		}
	case TEST4:
		return []models.Card{
			{
				Header:     "reprehenderit qui",
				Text:       "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, becau",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
		}
	case TEST5:
		return []models.Card{
			{
				Header:     "omnis iste natus",
				Text:       "vero eos et accusamus et iusto odio dignissimos ducimus qui blanditiis praesentium voluptatum deleniti atque corrupti quos dolores et quas molestias excepturi sint occaecati cupiditate non provident, similique sunt in culpa qui officia deserunt mollitia animi, id est laborum et dolorum fuga. Et harum quidem rerum facilis est et expedita distinctio. Nam libero tempore, cum soluta nobis est eligendi optio cumque nihil impedit quo mi",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
			{
				Header:     "reprehenderit qui",
				Text:       "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, becau",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
		}
	case TEST6:
		return []models.Card{
			{
				Header:     "beatae vitae dicta",
				Text:       "uod maxime placeat facere possimus, omnis voluptas assumenda est, omnis dolor repellendus. Temporibus autem quibusdam et aut officiis debitis aut rerum necessitatibus saepe eveniet ut et voluptates repudiandae sint et molestiae non recusandae. Itaque earum rerum hic tenetur a sapiente delectus",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
			{
				Header:     "reprehenderit qui",
				Text:       "But I must explain to you how all this mistaken idea of denouncing pleasure and praising pain was born and I will give you a complete account of the system, and expound the actual teachings of the great explorer of the truth, the master-builder of human happiness. No one rejects, dislikes, or avoids pleasure itself, becau",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
		}
	case TEST7:
		return []models.Card{
			{
				Header:     "minima veniam",
				Text:       "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they canno",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
		}
	case TEST8:
		return []models.Card{
			{
				Header:     "rerum et possimus",
				Text:       "s to those who fail in their duty through weakness of will, which is the same as saying through shrinking from toil and pain. These cases are perfectly simple and",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
			{
				Header:     "minima veniam",
				Text:       "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they canno",
				TrueAnswer: "true",
				Values:     generateArray(),
			},
		}

	}
	return []models.Card{
		{
			Header:     RANDOM,
			Text:       "абоба или не абоба?",
			TrueAnswer: "true",
			Values:     generateArray(),
		},
		{
			Header:     "RANDOM",
			Text:       "On the other hand, we denounce with righteous indignation and dislike men who are so beguiled and demoralized by the charms of pleasure of the moment, so blinded by desire, that they canno",
			TrueAnswer: "true",
			Values:     generateArray(),
		},
	}
}
func GetSpecialRestorationCard() models.Card {
	return models.Card{
		Type:      typeSituation,
		Header:    "Держи жабу",
		Text:      "Удача на вашей стороне. Вам подарили немножко денег.",
		Character: "saver",
		Values:    generateArray(),
	}
}
func GetRandomCard() models.Card {
	return models.Card{
		Type:       typeSituation,
		Header:     "Рандомная ситуация для анализа",
		Text:       "Свайпайте влево чтобы набить 5к для перехода на следующий блок заданий",
		TrueAnswer: "false",
		Values:     generateArray(),
	}
}

func GetFinancialCard() models.Card {
	return models.Card{
		Type:       typeSituation,
		Header:     "Вас посетил Пантелеич Мавроди",
		Text:       "Вкладывайтесь в МММ",
		TrueAnswer: "false",
		Character:  "mavrodi",
		Values:     generateArray(),
	}
}

func GetAdvertisment() models.Card {
	return models.Card{
		Type:       typeSituation,
		Header:     "Мой муж трейдит всю ночь!",
		Text:       "Чтобы ваш портфель вырос надо всего лишь...",
		TrueAnswer: "deeplink",
		Values:     generateArray(),
		Link:       "https://apps.apple.com/ru/app/%D0%B2%D1%82%D0%B1-%D0%BC%D0%BE%D0%B8-%D0%B8%D0%BD%D0%B2%D0%B5%D1%81%D1%82%D0%B8%D1%86%D0%B8%D0%B8/id1364026756",
	}
}
func GetShare() models.Card {
	return models.Card{
		Type:       typeSituation,
		Header:     "Пошарить прогресс",
		Text:       "ПОДЕЛИТЬСЯ С ДРУЗЬЯМИ КАКОЙ ВЫ КРУТОЙ",
		TrueAnswer: "deeplink",
		Values:     generateArray(),
		Link:       "https://vk.com/share.php?title=vtb&url=https://www.vtb.ru/",
	}
}
func generateArray() (arr []int) {
	for i := 0; i < 12; i++ {
		arr = append(arr, rand.Intn(20)+10)
	}
	return arr
}

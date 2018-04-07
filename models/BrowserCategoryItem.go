package models

/* Представляет краткую информацию об упражнении,
	программе тренировок или диете, отображаемая в составе
	какой-либо категории (карточка)
*/
type BrowserCategoryItem struct {
	ID 		int					`db:"id"`
	Difficulty int				`db:"Difficulty"`
	Name 	string				`db:"Name"`
	Description string			`db:"Description"`
	ShortDescription string		`db:"ShortDescription"`
	Image 	string				`db:"Image"`
	Rating 	float32				`db:"Rating"`
	Voted   int					`db:"Voted"`
	Price 	int					`db:"Price"`

	/* Не используемые поля, необходимые для корректного получения результата
		данные поля присутствуют только в некоторых объктах и могут отсутствовать
		у других. */
	MuscleGroup int 			`db:"MuscleGroup" json:"-"`
	IsBase	bool				`db:"IsBase" json:"-"`
}

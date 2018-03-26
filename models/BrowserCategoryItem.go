package models

/* Представляет краткую информацию об упражнении,
	программе тренировок или диете, отображаемая в составе
	какой-либо категории (карточка)
*/
type BrowserCategoryItem struct {
	Name 	string
	Description string
	Price 	int
	Image 	string
	Rating 	int		// Оценка
}

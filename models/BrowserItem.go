package models

/* Представляет краткую информацию об упражнении,
	программе тренировок или диете, отображаемая в составе
	какой-либо категории (карточка)
*/
type BrowserItem struct {
	Name 	string
	Price 	int
	Image 	string
	Rating 	int		// Оценка
}

package models

/* Упражнения или программы или диеты, сгрупированные
	в какую-либо категорию */
type BrowserCategory struct {
	ID uint
	Name string	// Название категории
	Description string // Дополнительное описание категории
	ItemType string // exercise, program или diet, определяет тип содержимого категории
	Items []BrowserCategoryItem
}

package models

/* Упражнения или программы или диеты, сгрупированные
	в какую-либо категорию */
type BrowserCategory struct {
	ID uint							`db:"id"`
	Name string						`db:"Name"`// Название категории
	Description string 				`db:"Description"`// Дополнительное описание категории
	ItemType string 				`db:"ItemType"`// exercise, program или diet, определяет тип содержимого категории
	Items []BrowserCategoryItem
}

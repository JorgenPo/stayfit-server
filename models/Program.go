package models

type Program struct {
	Name string
	Description string
	Image string
	Difficulty int
	ProgramType string // Тип программы, full-body, split, novice, ...
	Price int
	Rating float32
}

package models

type Exercise struct {
	Name		string
	Description string
	Image		string
	Difficulty 	int
	Category 	MuscleGroup
	IsBase		bool
	Price 		int
	Rating		int
}

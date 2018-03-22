package server

import "github.com/jorgenpo/stayfit-server/models"

type StayFitInterface interface {
	/* Возвращает категории от from до to упражнений или программ */
	getBrowserCategories(from int, to int) []models.BrowserCategory
}
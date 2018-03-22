package server

import (
	"github.com/jorgenpo/stayfit-server/models"
	"github.com/jorgenpo/stayfit-server/config"
	"github.com/jorgenpo/stayfit-server/database"
)

/* Реализация интерфейса StayFitInterface */
type StayFitServer struct {
	ServerConfig config.Config
	ServerDatabase database.Database
}

/* Возвращает категории для показа на главной странице браузера.
	Категории содержат карточки упражнений, программ или диет.
	Каждая карточка это очень краткое описание конкретной программы, упражнения
	или диеты */
func (s StayFitServer) getBrowserCategories(from int, to int) []models.BrowserCategory {
	var categories []models.BrowserCategory;

	db := s.ServerDatabase


	return categories;
}
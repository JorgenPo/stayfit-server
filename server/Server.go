package server

import (
	"github.com/jorgenpo/stayfit-server/models"
	"github.com/jorgenpo/stayfit-server/config"
	"github.com/jorgenpo/stayfit-server/database"
	"fmt"
	"log"
)

/* Реализация интерфейса StayFitInterface */
type StayFitServer struct {
	ServerConfig   config.Config
	ServerDatabase database.Database
	handler        Handler
}

func (s StayFitServer) Init(config config.Config, database database.Database) {
	s.ServerConfig = config
	s.ServerDatabase = database

	s.handler = Handler{server:&s}
	s.handler.Serve(config.ServerListenPort)
}

/* Возвращает категории для показа на главной странице браузера.
	Категории содержат карточки упражнений, программ или диет.
	Каждая карточка это очень краткое описание конкретной программы, упражнения
	или диеты */
func (s StayFitServer) GetBrowserCategories(from int, to int) ([]models.BrowserCategory, error) {
	var categories []models.BrowserCategory

	db := s.ServerDatabase.Sql

	err := db.Select(&categories, "select * from browser_categories as categories " +
		"LIMIT ?, ?", from, to)

	if err != nil {
		return categories, err
	}

	for i, _ := range categories {
		err := s.getCategoryItems(&categories[i])
		if err != nil {
			log.Println(err)
		}
	}

	return categories, nil
}

func (s StayFitServer) getCategoryItems(category *models.BrowserCategory) error {
	db := s.ServerDatabase.Sql

	/* Представления отдельных категорий хранятся как view_... */
	itemQuery := fmt.Sprintf("select * from view_category%d", category.ID)

	err := db.Select(&category.Items, itemQuery)
	if err != nil {
		log.Println(err)
	}

	return nil
}

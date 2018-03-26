package server

import (
	"github.com/jorgenpo/stayfit-server/models"
	"github.com/jorgenpo/stayfit-server/config"
	"github.com/jorgenpo/stayfit-server/database"
	"fmt"
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

	categoryRows, err := db.Query("select * from browser_categories as categories " +
		"LIMIT ?, ?", from, to)

	if err != nil {
		return categories, err
	}

	for categoryRows.Next() {
		var category = models.BrowserCategory{}
		categoryRows.Scan(&category.ID, &category.Name, &category.Description, &category.ItemType)

		err := s.getCategoryItems(&category)
		if err != nil {
			return categories, err
		}

		categories = append(categories, category)
	}

	return categories, nil
}

func (s StayFitServer) getCategoryItems(category *models.BrowserCategory) error {
	db := s.ServerDatabase.Sql

	itemQuery := fmt.Sprintf("select %[1]s.Name, %[1]s.Description, %[1]s.Image, %[1]s.Rating " +
		"from browser_category_items as categoryItems " +
		"left join %[1]s on %[1]s.id = categoryItems.Item " +
		"where categoryItems.Category = ?", category.ItemType)

	itemRows, err := db.Query(itemQuery, category.ID)

	if err != nil {
		return err
	}

	for itemRows.Next() {
		var item models.BrowserCategoryItem

		itemRows.Scan(&item.Name, &item.Description, &item.Image, &item.Rating)
		category.Items = append(category.Items, item)
	}

	return nil
}

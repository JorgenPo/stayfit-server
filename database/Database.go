package database

import (
	_ "github.com/go-sql-driver/mysql"
	"github.com/jmoiron/sqlx"
	"fmt"
)

type Database struct {
	Name string
	User string
	Password string
	Sql* sqlx.DB
}

func GetDatabase(name string, user string, password string) (Database, error) {
	database := Database{}

	db, err := sqlx.Open("mysql",
		fmt.Sprintf("%s:%s@/%s", user, password, name))

	if err != nil {
		return database, err
	}

	database.Name = name
	database.User = user
	database.Password = password
	database.Sql = db

	return database, nil
}

func (d Database) Close() {
	d.Sql.Close()
}

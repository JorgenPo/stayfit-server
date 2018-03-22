package main

import (
	"github.com/jorgenpo/stayfit-server/config"
	"log"
	"os"
	"github.com/jorgenpo/stayfit-server/database"
)

func main() {
	serverConfig, err := config.GetConfig()
	if err != nil {
		log.Fatalf("Failed to load config file: %e", err)
		os.Exit(1)
	}

	serverDatabase, err := database.GetDatabase(serverConfig.DatabaseName,
		serverConfig.DatabaseUser, serverConfig.DatabasePassword)
	if err != nil {
		log.Fatalf("Failed to open database connection: %e", err)
		os.Exit(2)
	}


}

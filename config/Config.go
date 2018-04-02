package config

import (
	"gopkg.in/ini.v1"
	"log"
)

const (
	configFileName = "config/config.ini"
)

type Config struct {
	/* [application] */
	ApplicationName string
	ApplicationVersionMajor int
	ApplicationVersionMinor int

	/* [database] */
	DatabaseName string
	DatabaseUser string
	DatabasePassword string

	/* [server] */
	ServerListenPort int

	/* [filesystem] */
	ImagesDirectory string
}

func GetConfig() (Config, error) {
	config := Config{}

	cfg, err := ini.Load(configFileName)
	if err != nil {
		log.Fatalf("Fail to load config file: %v", err)
		return config, err
	}

	application := cfg.Section("application")
	database := cfg.Section("database")
	server := cfg.Section("server")
	filesystem := cfg.Section("filesystem")

	//[application]
	config.ApplicationName = application.Key("application_name").String()
	config.ApplicationVersionMajor, _ = application.Key("application_version_major").Int()
	config.ApplicationVersionMinor, _ = application.Key("application_version_minor").Int()

	//[database]
	config.DatabaseName = database.Key("database_name").String()
	config.DatabaseUser = database.Key("database_user").String()
	config.DatabasePassword = database.Key("database_password").String()

	//[server]
	config.ServerListenPort, _ = server.Key("server_listen_port").Int()

	//[filesystem]
	config.ImagesDirectory = filesystem.Key("images_directory").String()

	return config, nil
}
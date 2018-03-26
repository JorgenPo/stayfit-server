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

	config.ApplicationName = application.Key("application_name").String()
	config.ApplicationVersionMajor, _ = application.Key("application_version_major").Int()
	config.ApplicationVersionMinor, _ = application.Key("application_version_minor").Int()

	config.DatabaseName = database.Key("database_name").String()
	config.DatabaseUser = database.Key("database_user").String()
	config.DatabasePassword = database.Key("database_password").String()

	config.ServerListenPort, _ = server.Key("server_listen_port").Int()

	return config, nil
}
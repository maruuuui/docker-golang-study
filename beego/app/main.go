package main

import (
	"app/models"
	_ "app/routers"

	beego "github.com/beego/beego/v2/server/web"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

func main() {
	setupDB()
	beego.Run()
}

func setupDB() {

	mysqlUser, err := beego.AppConfig.String("db_user_name")
	if err != nil {
		panic("failed to get db_user_name")
	}
	mysqlPass, err := beego.AppConfig.String("db_user_password")
	if err != nil {
		panic("failed to get db_user_password")
	}
	mysqlHost, err := beego.AppConfig.String("db_host")
	if err != nil {
		panic("failed to get db_host")
	}
	mysqldb, err := beego.AppConfig.String("db_name")
	if err != nil {
		panic("failed to get db_name")
	}
	// dsn := "user:pass@tcp(127.0.0.1:3306)/dbname?charset=utf8mb4&parseTime=True&loc=Local"
	dsn := mysqlUser + ":" + mysqlPass + "@" + mysqlHost + "/" + mysqldb + "?charset=utf8mb4&parseTime=True&loc=Local"
	db, err := gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}

	// Migrate the schema
	db.AutoMigrate(&models.ToDo{})

}

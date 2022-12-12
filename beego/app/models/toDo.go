package models

import (
	"time"

	beego "github.com/beego/beego/v2/server/web"
	"github.com/google/uuid"
	"gorm.io/driver/mysql"
	"gorm.io/gorm"
)

// ToDoの構造体を作成する
type ToDo struct {
	// ToDoのID
	ID string `gorm:"primaryKey" json:"id"`
	// ToDoのタイトル
	Title string `json:"title"`
	// メモ
	Memo string `json:"memo"`
	// 締め切り日時
	Deadline time.Time `json:"deadline"`
	// 作成日時 DB保存時に自動的に入る値
	CreatedAt time.Time `json:"createdAt"`
}

// ToDoListタイプを作成
type ToDoList []ToDo

// DB接続用
var db = setupDB()

// 1件作成
func CreateToDo(title string, memo string, deadline time.Time) (toDO ToDo) {
	toDO = ToDo{
		ID:       uuid.New().String(),
		Title:    title,
		Memo:     memo,
		Deadline: deadline,
	}
	result := db.Create(&toDO)
	if result.Error != nil {
		panic("failed to create todo")
	}
	return toDO
}

// 全件取得
func GetAllToDo() (toDoList ToDoList) {
	result := db.Find(&toDoList)
	if result.Error != nil {
		panic("failed to get todo")
	}
	return
}

// 1件取得
func GetToDo(id string) (toDo ToDo) {
	toDo = ToDo{
		ID:    "hogehoge",
		Title: "ToDoのタイトルが入ります",
		Memo:  "メモです",
	}
	return
}

// Delete
func DeleteToDo(id string) {
	toDo := ToDo{
		ID: id,
	}
	db.Delete(&toDo)
}

func setupDB() (db *gorm.DB) {

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

	dsn := mysqlUser + ":" + mysqlPass + "@" + mysqlHost + "/" + mysqldb + "?charset=utf8mb4&parseTime=True&loc=Local"
	db, err = gorm.Open(mysql.Open(dsn), &gorm.Config{})
	if err != nil {
		panic("failed to connect database")
	}
	return db
}

package controllers

// 画面を扱うコントローラ

import (
	"app/models"
	"sort"

	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}

// フロントで使用する形式に変換したコンテンツ
type ToDoResponse struct {
	ID       string `json:"id"`
	Title    string `json:"title"`
	Memo     string `json:"memo"`
	Deadline string `json:"deadline"`
}

type ToDoListResponse = []ToDoResponse

func (c *MainController) Get() {

	// 全件取得
	toDoList := models.GetAllToDo()

	// 締め切り日時でソート
	sort.Slice(toDoList, func(i, j int) bool { return toDoList[i].Deadline.Before(toDoList[j].Deadline) })

	toDoListResponse := ToDoListResponse{}
	for _, toDo := range toDoList {
		// time.Time型のdeadlineをYYYY/MM/DD HH:MM形式の文字列にパースする
		toDoResponse := ToDoResponse{
			toDo.ID,
			toDo.Title,
			toDo.Memo,
			toDo.Deadline.Format("2006/01/02 15:04"),
		}
		toDoListResponse = append(toDoListResponse, toDoResponse)
	}

	c.Data["toDoList"] = toDoListResponse
	c.TplName = "index.tpl"
}

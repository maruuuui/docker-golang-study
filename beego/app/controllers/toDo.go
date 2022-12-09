package controllers

// 画像ファイルを配信するコントローラ

import (
	"app/models"

	beego "github.com/beego/beego/v2/server/web"
)

type ToDoController struct {
	beego.Controller
}

func (c *ToDoController) Get() {
	var toDoList = models.GetAllToDo()	

	c.Data["json"] = toDoList
	c.ServeJSON()
}

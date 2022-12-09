package controllers
// 画面を扱うコントローラ

import (
	"app/models"
	beego "github.com/beego/beego/v2/server/web"
)

type MainController struct {
	beego.Controller
}

func (c *MainController) Get() {

	c.Data["toDoList"] =  models.GetAllToDo()	
	c.TplName = "index.tpl"
}

package routers

import (
	"app/controllers"

	beego "github.com/beego/beego/v2/server/web"
)

func init() {
	beego.Router("/", &controllers.MainController{})
	ns := beego.NewNamespace("/todo",
		beego.NSInclude(&controllers.ToDoController{}),
	)
	beego.AddNamespace(ns)
}

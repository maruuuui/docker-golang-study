package routers

import (
	beego "github.com/beego/beego/v2/server/web"
	"github.com/beego/beego/v2/server/web/context/param"
)

func init() {

    beego.GlobalControllerRouter["app/controllers:ToDoController"] = append(beego.GlobalControllerRouter["app/controllers:ToDoController"],
        beego.ControllerComments{
            Method: "Delete",
            Router: "/todo/:id",
            AllowHTTPMethods: []string{"delete"},
            MethodParams: param.Make(),
            Filters: nil,
            Params: nil})

}

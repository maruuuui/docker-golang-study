package controllers

// 画像ファイルを配信するコントローラ

import (
	"app/models"
	"encoding/json"
	"fmt"
	"time"

	beego "github.com/beego/beego/v2/server/web"
)

type ToDoController struct {
	beego.Controller
}

// Createのリクエストボディ
type CreateRequestBody struct {
	Title    string `json:"title"`
	Memo     string `json:"memo"`
	Deadline string `json:"deadline"`
}

// Deleteのリクエストボディ
type DeleteRequestBody struct {
	ID string `json:"id"`
}

// @router / [get]
func (c *ToDoController) Get() {
	var toDoList = models.GetAllToDo()

	c.Data["json"] = toDoList
	c.ServeJSON()
}

// @router / [post]
func (c *ToDoController) Post() {
	fmt.Println("Post")
	// CreateRequestBodyにパースする
	var createRequestBody CreateRequestBody
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &createRequestBody); err != nil {
		c.Ctx.ResponseWriter.WriteHeader(400)
		c.Ctx.Output.SetStatus(500)
		c.Data["json"] = "json parse error"
		c.ServeJSON()
		return
	}
	fmt.Println("createRequestBody", createRequestBody)

	// YYYY/MM/DD HH:MM形式の文字列をtime.Timeにパース
	deadline, _ := time.Parse(
		"2006/01/02 15:04",
		createRequestBody.Deadline,
	)

	toDo := models.CreateToDo(
		createRequestBody.Title,
		createRequestBody.Memo,
		deadline,
	)

	c.Data["json"] = toDo
	c.ServeJSON()
}

// @router /:id [delete]
func (c *ToDoController) Delete() {
	fmt.Println("Delete")
	id := c.Ctx.Input.Param(":id")
	fmt.Println("deleteRequest", id)

	models.DeleteToDo(id)

	c.ServeJSON()
}

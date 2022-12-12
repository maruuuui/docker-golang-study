package controllers

// 画像ファイルを配信するコントローラ

import (
	"app/models"
	"encoding/json"
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

func (c *ToDoController) Get() {
	var toDoList = models.GetAllToDo()

	c.Data["json"] = toDoList
	c.ServeJSON()
}

func (c *ToDoController) Create() {
	// CreateRequestBodyにパースする
	var createRequestBody CreateRequestBody
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &createRequestBody); err != nil {
		c.Ctx.WriteString("json parse error")
		return
	}

	// YYYY-MM-DDTHH:MM:SSZZZZ形式の文字列をtime.Timeにパース
	deadline, _ := time.Parse(
		"2006-01-02T15:04:05Z07:00",
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

func (c *ToDoController) Delete() {
	// DeleteRequestBodyにパースする
	var deleteRequestBody DeleteRequestBody
	if err := json.Unmarshal(c.Ctx.Input.RequestBody, &deleteRequestBody); err != nil {
		c.Ctx.WriteString("json parse error")
		return
	}
	models.DeleteToDo(deleteRequestBody.ID)

	c.ServeJSON()
}

package models

// ToDoの構造体を作成する
type ToDo struct {
	ID    string `json:"id"`
	Title string `json:"toDo"`
	Memo  string `json:"memo"`
}

// ToDoArrayタイプを作成
type ToDoArray []ToDo

func GetAll() (toDoArray ToDoArray) {
 	toDoArray = ToDoArray{
		{
			ID:    "hogehoge",
			Title: "ToDoのタイトルが入ります",
			Memo:  "メモです",
		},
	}
    return 
}

func GetToDo(id string) (toDo ToDo){
	toDo = ToDo{
		ID:    "hogehoge",
		Title: "ToDoのタイトルが入ります",
		Memo:  "メモです",
	}
    return 
}
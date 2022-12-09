package models

// ToDoの構造体を作成する
type ToDo struct {
	ID    string `json:"id"`
	Title string `json:"toDo"`
	Memo  string `json:"memo"`
}

// ToDoListタイプを作成
type ToDoList []ToDo

func GetAllToDo() (toDoList ToDoList) {
 	toDoList = ToDoList{
		{
			ID:    "hogehoge",
			Title: "ToDoのタイトルが入ります",
			Memo:  "メモです",
		},
				{
			ID:    "hugahuga",
			Title: "ToDoのタイトルが入ります2",
			Memo:  "メモですメモですメモですメモですメモですメモです",
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
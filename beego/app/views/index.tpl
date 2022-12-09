<!DOCTYPE html>

<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="static/css/bootstrap.min.css">

    <title>ToDoアプリ</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
</head>

<body>
    <header>
        <nav class="navbar navbar-light bg-light">
            <div class="container-fluid">
                <span class="navbar-brand mb-0 h1">ToDoアプリ</span>
                <!-- ToDo追加モーダル(#createToDoModal)を表示するボタン -->
                <button class="btn btn-success" type="submit" data-bs-toggle="modal"
                    data-bs-target="#createToDoModal">新規作成</button>
            </div>
        </nav>
    </header>

    <div class="minigrid-cards">
        {{ range.toDoList }}
        <div class="minigrid-card">
            <div class="card" style="">
                <div class="card-body">
                    <h5 class="card-title">{{.Title}}</h5>
                    <h6 class="card-subtitle mb-2 text-muted">期限:20XX/XX/XX</h6>
                    <p class="card-text">{{.Memo}}.</p>
                    <!-- ToDo完了確認モーダル(#askCompleteToDoModal)を表示するボタン -->
                    <button value="{{.ID}}" class="btn btn-primary askCompleteToDoModalButton" type="submit"
                        data-bs-toggle="modal" data-bs-target="#askCompleteToDoModal">完了！</button>
                </div>
            </div>
            <br>

        </div>
        {{end}}
    </div>




    <!-- ToDo追加モーダル(#askCompleteToDoModal) -->
    <div class="modal fade" id="createToDoModal" tabindex="-1" aria-labelledby="createToDoModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createToDoModalLabel">ToDo追加フォーム</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    タイトル、メモ、期限を入力させるフォームをここに配置
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="createToDoButton">ToDo追加</button>
                </div>
            </div>
        </div>
    </div>
    <!-- ToDo完了確認モーダル(#askCompleteToDoModal) -->
    <div class="modal fade" id="askCompleteToDoModal" tabindex="-1" aria-labelledby="askCompleteToDoModalLabel"
        aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="askCompleteToDoModalLabel">確認</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    完了しますか？
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-primary" id="completeToDoButton">完了！</button>
                </div>
            </div>
        </div>
    </div>

    <script src="/static/js/minigrid.min.js"></script>
    <script src="/static/js/bootstrap.bundle.min.js"></script>
</body>

</html>

<script>
    // 完了リクエストをするToDoのID
    let targetId;

    (function() {
            // minigridの初期設定
            // https://github.com/hnqlv/minigrid
            let grid;

            function init() {
                grid = new Minigrid({
                    container: '.minigrid-cards',
                    item: '.minigrid-card',
                    gutter: 12
                });
                grid.mount();
            }

            function update() {
                grid.mount();
            }

            document.addEventListener('DOMContentLoaded', init);
            window.addEventListener('resize', update);

            // ToDo追加ボタン押下時の処理
            const createToDoButton = document.getElementById("createToDoButton");
            createToDoButton.addEventListener("click", function() {
                console.log("ToDo追加ボタンが押下されたよ");
            });

            // ToDo完了ボタン押下時の処理
            const askCompleteToDoModalButtons = document.getElementsByClassName("askCompleteToDoModalButton");
            for (let index = 0; index < askCompleteToDoModalButtons.length; index++) {
                const askCompleteToDoModalButton = askCompleteToDoModalButtons[index];
                askCompleteToDoModalButton.addEventListener("click", function() {
                    targetId = askCompleteToDoModalButton.value
                    console.log(`${targetId}のToDo完了ボタンが押下されたよ`);
                });

            }


            // ToDo完了ボタン押下時の処理
            const completeToDoButton = document.getElementById("completeToDoButton");
            completeToDoButton.addEventListener("click", function() {
                console.log(`${targetId}のToDo完了ボタンが押下されたよ`);        });
            })();
</script>

<style>
    .minigrid-card {
        width: 200px;
    }
</style>
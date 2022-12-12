<!DOCTYPE html>

<html>

<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/2.11.6/umd/popper.min.js"></script>

    <!-- minigrid -->
    <script src="/static/js/minigrid.min.js"></script>
    <!-- end minigrid -->

    <!-- Bootstrap -->
    <script src="/static/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="static/css/bootstrap.min.css">
    <!-- end Bootstrap -->


    <!-- Font awesome is not required provided you change the icon options -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/solid.min.js"></script>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/js/fontawesome.min.js"></script>
    <!-- end FA -->

    <!-- TempusDominus -->
    <script src="/static/js/tempus-dominus.js"></script>
    <link rel="stylesheet" href="static/css/tempus-dominus.css">
    <!-- end TempusDominus -->

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
            <div class="card">
                <div class="card-body">
                    <h5 class="card-title">{{.Title}}</h5>
                    <h6 class="card-subtitle mb-2 text-muted">期限:{{.Deadline}}</h6>
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
                    <div class="title mb-3">
                        <label for="titleInput" class="form-label">タイトル</label>
                        <input type="email" class="form-control" id="titleInput">
                    </div>
                    <div class="memo mb-3">
                        <label for="memoTextarea" class="form-label">備考</label>
                        <textarea class="form-control" id="memoTextarea" rows="3"></textarea>
                    </div>
                    <div class="deadline mb-3">
                        <label for="deadlineDatetimepickerInput" class="form-label">締め切り日時</label>
                        <div class="input-group" id="deadlineDatetimepicker" data-td-target-input="nearest"
                            data-td-target-toggle="nearest">
                            <input id="deadlineDatetimepickerInput" type="text" class="form-control"
                                data-td-target="#deadlineDatetimepicker" />
                            <span class="input-group-text" data-td-target="#deadlineDatetimepicker"
                                data-td-toggle="datetimepicker">
                                <span class="fa-solid fa-calendar"></span>
                            </span>
                        </div>
                    </div>
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



</body>

</html>
<script type="module">
    // 完了リクエストをするToDoのID
    let targetId;

    (function () {
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
        createToDoButton.addEventListener("click", function () {
            console.log("ToDo追加ボタンが押下されたよ");
        });

        // ToDo完了確認ボタン押下時の処理
        const askCompleteToDoModalButtons = document.getElementsByClassName("askCompleteToDoModalButton");
        for (let index = 0; index < askCompleteToDoModalButtons.length; index++) {
            const askCompleteToDoModalButton = askCompleteToDoModalButtons[index];
            askCompleteToDoModalButton.addEventListener("click", function () {
                targetId = askCompleteToDoModalButton.value
                console.log(`${targetId}のToDo完了確認ボタンが押下されたよ`);
            });

        }

        // ToDo完了ボタン押下時の処理
        const completeToDoButton = document.getElementById("completeToDoButton");
        completeToDoButton.addEventListener("click", function () {
            console.log(`${targetId}のToDo完了ボタンが押下されたよ`);
        });
    })();


    // datepickerの設定
    window.deadlineDatetimepicker = new tempusDominus.TempusDominus(
        document.getElementById('deadlineDatetimepicker'),
        {
            defaultDate: new Date().toISOString()
        }
    );
</script>

<style>
    .minigrid-card {
        width: 200px;
    }
</style>
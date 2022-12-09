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
                <button class="btn btn-success" type="submit">新規作成</button>
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
                </div>
            </div>
            <br>

        </div>
        {{end}}
    </div>

    <script src="/static/js/minigrid.min.js"></script>
    <script src="/static/js/bootstrap.bundle.min.js"></script>
</body>

</html>

<script>
    // minigridの初期設定
    // https://github.com/hnqlv/minigrid
    (function() {
        var grid;

        function init() {
            grid = new Minigrid({
                container: '.minigrid-cards',
                item: '.minigrid-card',
                gutter: 12
            });
            grid.mount();
        }

        // mount
        function update() {
            grid.mount();
        }

        document.addEventListener('DOMContentLoaded', init);
        window.addEventListener('resize', update);
    })();
</script>

<style>
    .minigrid-card {
        width: 200px;
    }
</style>
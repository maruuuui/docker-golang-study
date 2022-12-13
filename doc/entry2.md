# Docker + beego + mysqlでToDoアプリを作る (アプリ作成編)

こんにちは、hashiです。  
「Docker + beego + mysqlでToDoアプリを作る」の後半として、  
この記事では環境構築以降のアプリ作成についてまとめようと思います。

## ディレクトリ構成

その中に以下のディレクトリ構成でファイルを配置します。

```sh
beego
├── app
│   ├── conf
│   │   └── app.conf
│   ├── controllers
│   │   ├── default.go
│   │   └── toDo.go
│   ├── models
│   │   └── toDo.go
│   ├── routers
│   │   ├── commentsRouter_controllers.go
│   │   └── router.go
│   ├── static
│   │   ├── css
│   │   ├── img
│   │   └── js
│   ├── views
│   │   └── index.tpl
│   ├── go.mod
│   ├── go.sum
│   └── main.go
└── Dockerfile

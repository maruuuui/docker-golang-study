# 手順メモ

- beego/Dockerfile
- mysql/initdb.d/beego_local.sql
- mysql/Dockerfile
- mysql/my.cnf
- .env
- docker-compose.yaml
以上のファイルを配置してから以下のコマンドを実行

```sh
# imageの作成
docker-compose build

# `bee new (プロジェクト名)`をコンテナ内で実行して新しいプロジェクトを作成
docker-compose run app bee new app
docker-compose run app sh -c "cd app && go get app"
```

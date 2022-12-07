# goバージョン
FROM golang:1.19-alpine as go-base
# 環境変数を設定
ENV SRC_DIR="/go/src/github.com/"\
    GOPATH="/go"\
    PATH="$GOPATH:$SRC_DIR:$PATH"

FROM go-base as initial
# アップデートとgitのインストール
RUN apk update && apk add git

FROM initial as development-base
# ディレクトリの作成
RUN mkdir -p /go/src/github.com/
# ワーキングディレクトリの設定
WORKDIR /go/src/github.com/

FROM development-base as development
# ホストのファイルをコンテナの作業ディレクトリに移行
ADD . /go/src/github.com/
# パッケージのインポート
RUN go install github.com/beego/bee/v2@v2.0.4
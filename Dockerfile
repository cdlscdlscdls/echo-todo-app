FROM golang:1.17.5-alpine
# アップデートとgitのインストール！！
RUN apk update && apk add --no-cache alpine-sdk build-base git
# appディレクトリの作成
RUN mkdir /go/src/app
# ワーキングディレクトリの設定
WORKDIR /go/src/app
# ホストのファイルをコンテナの作業ディレクトリに移行
ADD . /go/src/app
RUN export CGO_ENABLED=0
RUN go get
CMD [ "go", "run", "main.go", "router.go"]

EXPOSE 8081

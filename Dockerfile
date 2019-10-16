FROM alpine:3.6

ENV VER=2.8.1 METHOD=chacha20 PASSWORD=ss123456 PORT=8080

RUN apk add --no-cache curl \
  && curl -sL https://github.com/xiaokaixuan/gost-heroku/releases/download/v${VER}/gost_${VER}_linux_amd64.tar.gz | tar zx \
  && chmod +x gost_${VER}_linux_amd64/gost

CMD /gost_${VER}_linux_amd64/gost -L=ss+mws://$METHOD:$PASSWORD@:$PORT


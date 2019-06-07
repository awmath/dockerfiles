FROM alpine as build

RUN \
  VERSION=$(wget -q -O - https://minecraft.net/de-de/download/server/bedrock/ | sed -n -r 's;^.*linux.*-([0-9.]+)\.zip.*$;\1;p') && \
  wget https://minecraft.azureedge.net/bin-linux/bedrock-server-${VERSION}.zip && \
  mkdir /bedrock-server && \
  unzip -q -d /bedrock-server bedrock-server-${VERSION}.zip 


FROM debian:stable-slim as publish

COPY --from=build /bedrock-server /bedrock-server

WORKDIR /bedrock-server

CMD LD_LIBRARY_PATH=. ./bedrock_server

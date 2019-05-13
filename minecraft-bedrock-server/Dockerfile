FROM alpine as build

ARG version="1.9.0.15"

ENV VERSION $version

RUN wget https://minecraft.azureedge.net/bin-linux/bedrock-server-${VERSION}.zip
RUN mkdir /bedrock-server
RUN unzip -q -d /bedrock-server bedrock-server-${VERSION}.zip 


FROM debian:stable-slim as publish

COPY --from=build /bedrock-server /bedrock-server

WORKDIR /bedrock-server

CMD LD_LIBRARY_PATH=. ./bedrock_server

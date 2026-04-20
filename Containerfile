FROM alpine:latest

RUN apk add --no-cache \
	lua \
	lua-dev \
	luarocks \
	git \
	build-base \
	curl \
	unzip \
	openssl \
	openssl-dev \
	openresty

RUN luarocks-5.1 install lapis

WORKDIR /app

COPY . .

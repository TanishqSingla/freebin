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
RUN luarocks-5.1 install base64

WORKDIR /app

COPY . .

EXPOSE 8080

CMD ["lapis", "server", "development"]

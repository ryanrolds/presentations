FROM alpine:latest

RUN apk --no-cache add ca-certificates make

WORKDIR /build
COPY . .

RUN make all

FROM nginx:alpine

WORKDIR /usr/share/nginx/html/

COPY --from=0 /build/js ./js
COPY --from=0 /build/images ./images
COPY --from=0 /build/*.html ./

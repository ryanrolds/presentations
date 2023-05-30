FROM alpine:3.17

RUN apk --no-cache add ca-certificates make

WORKDIR /build
COPY . .

RUN make all

FROM nginx:1.25.0-alpine3.17-slim

WORKDIR /usr/share/nginx/html/

COPY --from=0 /build/js ./js
COPY --from=0 /build/images ./images
COPY --from=0 /build/*.html .

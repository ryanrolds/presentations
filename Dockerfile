FROM nginx:1.25.0-alpine3.17-slim

COPY *.html /usr/share/nginx/html/

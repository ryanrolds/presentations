FROM nginx:1.25.0-alpine3.17-slim

COPY js /usr/share/nginx/html/js/
COPY images /usr/share/nginx/html/images/
COPY *.html /usr/share/nginx/html/

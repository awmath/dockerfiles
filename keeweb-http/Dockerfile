FROM antelle/keeweb:latest

FROM nginx:alpine
COPY --from=0 /keeweb/ /usr/share/nginx/html/

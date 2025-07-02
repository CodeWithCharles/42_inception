FROM alpine:3.18
RUN apk add --no-cache nginx
COPY index.html /usr/share/nginx/html/index.html
EXPOSE 8081
CMD ["nginx", "-g", "daemon off;"]

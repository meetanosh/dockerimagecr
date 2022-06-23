ARG VERSION=20.04
FROM ubuntu:${VERSION}
MAINTAINER "sudheer sudheer@gmail.com"
RUN apt update && apt install -y nginx curl
COPY index.html /usr/share/nginx/html
ADD index.html /var/www/html
VOLUME /var/www/html
EXPOSE 80
ENTRYPOINT ["nginx", "-g"]
CMD ["daemon off;"]
HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1

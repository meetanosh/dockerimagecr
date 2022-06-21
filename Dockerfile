ARG VERSION=20.04
FROM ubuntu:${VERSION}
MAINTAINER "sudheer sudheer@gmail.com"
LABEL environment=production
RUN apt update && apt install -y nginx curl
WORKDIR /usr/share/nginx/html
COPY index.html .
ENV MYSQL_ROOT_PASSWORD=test12345
WORKDIR /var/www/html
ADD index.html .
WORKDIR /
VOLUME /var/www/html
EXPOSE 80
ENTRYPOINT ["nginx", "-g"]
CMD ["daemon off;"]
HEALTHCHECK CMD curl --fail http://localhost:80/ || exit 1

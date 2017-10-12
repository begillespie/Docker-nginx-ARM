FROM arm32v6/alpine

MAINTAINER Brian Gillespie begillespie

RUN apk update && \
	apk upgrade && \
	apk add nginx && \
	adduser -S www-data && \
	chown -R www-data:www-data /var/lib/nginx && \
# Location for the nginx.pid file
	mkdir run/nginx

COPY nginx.conf /etc/nginx/
COPY conf.d/* /etc/nginx/conf.d/
COPY htdocs/* /var/www/localhost/htdocs

CMD ["nginx", "-g", "daemon off;"]

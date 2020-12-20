FROM centos
MAINTAINER bob
LABEL maintainer="marco mazzucc"
LABEL email="mgmazzucco@gmail.com"
PORT 8080
RUN yum install -y httpd && \
    sed -e '1,%s/Listen 80/Listen 8080/' -i /etc/httpd/conf/httpd.conf &&\
    chown -R 48:48 /etc/httpd/logs &&\
    chown -R 48:48 /run/httpd  &&\
    chown -R 48:48 /var/www/html  &&\
USER 1001
COPY src/ /var/www/html/
CMD httpd -D FOREGROUND


FROM centos
MAINTAINER bob
LABEL maintainer="marco mazzucc"
LABEL email="mgmazzucco@gmail.com"
EXPOSE 8080
RUN yum install -y httpd && \
    sed -e 's/Listen 80/Listen 8080/' -i /etc/httpd/conf/httpd.conf &&\
    chown -R 48:48 /var/log/httpd &&\
    chown -R 48:48 /run/httpd  &&\
    touch /run/httpd.pid && chown 48:48 /run/httpd.pid && \
    chown -R 48:48 /var/www/html  
USER apache
COPY src/ /var/www/html/
CMD httpd -D FOREGROUND


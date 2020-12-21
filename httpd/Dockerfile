FROM centos
MAINTAINER bob
LABEL maintainer="marco mazzucc"
LABEL email="mgmazzucco@gmail.com"
EXPOSE 8080
RUN yum install -y httpd && \
    sed -e 's/Listen 80/Listen 8080/' -i /etc/httpd/conf/httpd.conf &&\
    chown -R 48:48 /etc/httpd/logs &&\
    chown -R 48:48 /run  &&\
    chown -R 48:48 /var/www/html  
USER apache
COPY src/ /var/www/html/
CMD httpd -D FOREGROUND


#FROM	do180/nodejs
FROM	nodejs
ENV     NODEJS_VERSION=8.0 \
        HOME=/opt/app-root/src
MAINTAINER username <username@example.com>

COPY run.sh build ${HOME}/
#RUN scl enable rh-nodejs8 'npm install --registry=http://$NEXUS_BASE_URL/repository/nodejs/'
RUN scl enable rh-nodejs8 'npm install --registry=https://registry.npmjs.org/'
EXPOSE	30080

CMD	["scl","enable","rh-nodejs8","./run.sh"]

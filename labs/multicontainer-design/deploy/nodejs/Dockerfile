#FROM	do180/nodejs
FROM	nodejs
ARG NEXUS_BASE_URL
MAINTAINER username <username@example.com>

COPY run.sh build.sh ${HOME}/
#RUN scl enable rh-nodejs8 'npm install --registry=http://$NEXUS_BASE_URL/repository/nodejs/'
RUN scl enable rh-nodejs8  'npm install'
EXPOSE	30080

CMD	["scl","enable","rh-nodejs8","./run.sh"]

FROM registry.redhat.io/ubi7/ubi:7.7
ENV NEXUS_VERSION=2.14.19-01 \
    NEXUS_HOME=/opt/nexus \
    CONTEXT_PATH="/nexus" \
    MAX_HEAP="768m" \
    MIN_HEAP="256m" \
    JAVA_OPTS="-server -Djava.net.preferIPv4Stack=true" \
    LAUNCHER_CONF="./conf/jetty.xml ./conf/jetty-requestlog.xml" \
    SONATYPE_WORK="/opt/nexus/sonatype-work"
    
RUN yum install -y --setopt=tsflags=nodocs java-1.8.0-openjdk-devel &&\
    yum clean all -y &&\
    mkdir -p ${NEXUS_HOME} &&\
    useradd -u 1001 nexus &&\
    chown -R nexus:nexus  /opt

USER nexus
RUN cd /tmp &&\
    curl -L https://download.sonatype.com/nexus/oss/nexus-2.14.20-02-bundle.tar.gz -O &&\
    tar zxvf nexus*.gz &&\
    mv /tmp/nexus-2.14.20-02/* /opt/nexus/ &&\
    mkdir ${SONATYPE_WORK} 

VOLUME ${SONATYPE_WORK}
WORKDIR ${NEXUS_HOME}

#CMD /bin/bash
CMD java \
  -Dnexus-work=${SONATYPE_WORK} \
  -Dnexus-webapp-context-path=${CONTEXT_PATH} \
  -Xms${MIN_HEAP} -Xmx${MAX_HEAP} \
  -cp 'conf/:lib/*' \
  ${JAVA_OPTS} \
  org.sonatype.nexus.bootstrap.Launcher ${LAUNCHER_CONF}

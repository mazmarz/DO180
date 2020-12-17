FROM registry.centos.org/centos
ENV NEXUS_VERSION='2.14.19-01'
ENV NEXUS_HOME=/opt/nexus
ADD open_ocp4-ha-lab.repo /etc/yum.repos.d/
RUN yum install -y java-1.8.0-openjdk-devel
RUN useradd nexus -u 1001 -d $NEXUS_HOME 
RUN chown  nexus:nexus $NEXUS_HOME 
USER nexus
COPY nexus-${NEXUS_VERSION}-bundle.tar.gz $NEXUS_HOME/
WORKDIR $NEXUS_HOME
RUN tar zxvf nexus-${NEXUS_VERSION}-bundle.tar.gz  && \
    mv nexus-${NEXUS_VERSION}/* .  && \
      rm -rf nexus-${NEXUS_VERSION}  
VOLUME ["/opt/nexus/sonatype-work"]
CMD ["sh", "nexus-start.sh"]
RUN  echo $PWD && ls -l 

ENV CONTEXT_PATH="/nexus"
ENV MAX_HEAP="768m"
ENV MIN_HEAP="356m"
ENV JAVA_OPTS="-server -Djava.net.preferIPv4Stack=true"
ENV LAUNCHER_CONF="./conf/jetty.xml ./conf/jetty-requestlog.xml"
ENV SONATYPE_WORK="${NEXUS_HOME}/sonatype-work"
CMD java \
  -Dnexus-work=${SONATYPE_WORK} \
  -Dnexus-webapp-context-path=${CONTEXT_PATH} \
  -Xms${MIN_HEAP} -Xmx${MAX_HEAP} \
  -cp 'conf/:lib/*' \
  ${JAVA_OPTS} \
  org.sonatype.nexus.bootstrap.Launcher ${LAUNCHER_CONF}

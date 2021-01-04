FROM registry.redhat.io/ubi7/ubi:7.7
ENV NEXUS_VERSION=2.14.19-01 \
    NEXUS_HOME=/opt/nexus
    
RUN yum install -y --setopt=tsflags=nodocs java-1.8.0-openjdk-devel &&\
    yum clean all -y &&\
    mkdir -p ${NEXUS_HOME} &&\
    useradd -u 1001 nexus &&\
    chown -R nexus:nexus  ${NEXUS_HOME}

COPY nexus-2.14.19-01-bundle.tar.gz /tmp

USER nexus
RUN cd /tmp ; tar zxvf nexus*.gz &&\
    mv /tmp/nexus*/nexus /opt/

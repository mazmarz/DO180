FROM registry.redhat.io/ubi7/ubi:7.7
ENV NEXUS_VERSION=2.14.19-01 \
    NEXUS_HOME=/opt/nexus
    
RUN yum install -y --setopt=tsflags=nodocs java-1.8.0-openjdk-devel &&\
    yum clean all -y &&\
    mkdir -p ${NEXUS_HOME} &&\
    useradd -u 1001 nexus &&\
    chown -R nexus:nexus  ${NEXUS_HOME}
curl -L https://download.sonatype.com/nexus/oss/nexus-2.14.20-02-bundle.tar.gz -O

USER nexus
RUN cd /tmp &&\
    curl -L https://download.sonatype.com/nexus/oss/nexus-2.14.20-02-bundle.tar.gz -O &&\
    tar zxvf nexus*.gz &&\
    mv /tmp/nexus*/nexus /opt/

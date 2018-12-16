FROM centos:latest

ENV GOCD_VERSION=18.10.0-7703

LABEL maintainer="Christian.Rohr@chrohr-online.de"

WORKDIR /tmp/

RUN curl https://download.gocd.org/GOCD-GPG-KEY.asc --output GOCD-GPG-KEY.asc && \
    curl https://download.gocd.org/binaries/${GOCD_VERSION}/rpm/go-server-${GOCD_VRSION}.noarch.rpm --output go-server-${GOCD_VERSION}.noarch.rpm && \
    rpm --import GOCD-GPG-KEY.asc && \
    rpm -ivh go-server-${GOCD_VERSION}.noarch.rpm

RUN curl https://www.centos.org/keys/RPM-GPG-KEY-CentOS-7 --output RPM-GPG-KEY-CentOS-7 && \
    rpm --import RPM-GPG-KEY-CentOS-7 && \
    yum -y install java-1.8.0-openjdk && \
    yum clean all

RUN rm -rf /tmp/

CMD /usr/share/go-server/server.sh

VOLUME [ "/etc/go" ]
VOLUME [ "/usr/local/go-server/artifacts"]
VOLUME [ "/usr/local/go-server/db"]
VOLUME [ "/usr/local/go-server/plugins"]

EXPOSE 8153/tcp
EXPOSE 8154/tcp
FROM centos:latest
RUN yum -y -q install java-1.8.0-openjdk wget
WORKDIR /tmp/RUN wget https://download.gocd.org/GOCD-GPG-KEY.asc
RUN wget https://download.gocd.org/binaries/18.9.0-7478/rpm/go-server-18.9.0-7478.noarch.rpm
RUN rpm --import GOCD-GPG-KEY.ascRUN rpm -ivh go-server-18.9.0-7478.noarch.rpm

CMD /usr/share/go-server/server.sh

VOLUME [ "/etc/go" ]
VOLUME [ "/usr/local/go-server/artifacts"]
VOLUME [ "/usr/local/go-server/db"]
VOLUME [ "/usr/local/go-server/plugins"]

EXPOSE 8153
EXPOSE 8154
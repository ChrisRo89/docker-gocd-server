# docker-gocd-server

[![Build Status](https://travis-ci.org/ChrisRo89/docker-gocd-server.svg?branch=master)](https://travis-ci.org/ChrisRo89/docker-gocd-server)

## Exposed ports / volumes

+ 8153-8154/tcp (http, https)
+ /etc/go
+ /usr/local/go-server/artifacts
+ /usr/local/go-server/db
+ /usr/local/go-server/plugins

### Examples:

docker run --name gocd_server -p 80:8153 - p 443:8154 -v /opt/go/etc:/etc/go -v /opt/go/artifcats:/usr/local/go-server/artifacts -v /opt/go/db:/usr/local/go-server/db -v /opt/go/plugins:/usr/local/go-server/plugins

# novnc
DockerHub repository: https://hub.docker.com/repository/docker/adito/novnc

based on python:slim-buster - https://hub.docker.com/_/python
Websockify - https://github.com/novnc/websockify
NoVNC https://github.com/novnc/noVNC

# ENVs

$WEBSERVER_HOST default is 0.0.0.0

$WEBSERVER_PORT default is 8080

$VNC_HOST default is localhost

$VNC_PORT default is 5900

$ARGS 

# Command
/bin/sh /websockify/run --web /novnc/ $WEBSERVER_PORT $VNC_HOST:$VNC_PORT $ARGS

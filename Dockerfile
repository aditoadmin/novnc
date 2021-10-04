FROM python:slim-buster

ENV WEBSERVER_HOST=0.0.0.0
ENV WEBSERVER_PORT=8080
ENV VNC_HOST=localhost
ENV VNC_PORT=5900

ADD https://github.com/novnc/noVNC/archive/refs/tags/v1.2.0.tar.gz /tmp/noVNC.tar.gz
ADD https://github.com/novnc/websockify/archive/refs/tags/v0.10.0.tar.gz /tmp/websockify.tar.gz

RUN mkdir -p /novnc /novnc/designer /websockify && \
 tar -zxvf /tmp/noVNC.tar.gz -C /tmp && \
 tar -zxvf /tmp/websockify.tar.gz -C /tmp && \
 mv /tmp/noVNC*/* /novnc/designer/ && \
 mv /tmp/websockify*/* /websockify/ && \
 rm -rf /tmp && \
 pip install numpy

CMD /bin/sh /websockify/run --web /novnc/ $WEBSERVER_PORT $VNC_HOST:$VNC_PORT $ARGS

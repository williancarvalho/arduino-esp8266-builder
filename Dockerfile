FROM python:2.7
LABEL maintainer="Willian de Carvalho <wcarvalho@ciandt.com>"

# install ARDUINO
ENV ARDUINO_VERSION=1.8.4
ADD artifacts/arduino-${ARDUINO_VERSION}-linux64.tar.xz /opt
WORKDIR /opt/arduino-${ARDUINO_VERSION}

# install Wifi Manager
RUN cd /opt/arduino-${ARDUINO_VERSION}/libraries && \
    git clone https://github.com/tzapu/WiFiManager.git WiFiManager && \
    cd WiFiManager && \
    git checkout tags/0.12

# install SimpleTimer lib
RUN cd /opt/arduino-${ARDUINO_VERSION}/libraries && \
    git clone https://github.com/jfturcot/SimpleTimer.git SimpleTimer && \
    cd SimpleTimer && \
    git checkout b30890b8f7046bf3b0258e5870e5dda78ac5c71a

# install esp8266
RUN cd /opt/arduino-${ARDUINO_VERSION}/hardware && \
    mkdir esp8266com && cd esp8266com && \
    git clone https://github.com/esp8266/Arduino.git esp8266 && \
    cd esp8266 && \
    git checkout tags/2.3.0 && \
    cd tools && \
    python get.py

ENTRYPOINT bash

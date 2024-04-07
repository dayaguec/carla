FROM carla-prerequisites:latest

USER root

RUN apt-get update ; \
  apt-get install -y curl

USER carla
WORKDIR /home/carla

RUN git clone --depth 1 https://github.com/dayaguec/carla.git

WORKDIR /home/carla/carla

RUN ./Update.sh
RUN make CarlaUE4Editor
RUN make PythonAPI
RUN make build.utils
RUN make package
RUN rm -r /home/carla/carla/Dist


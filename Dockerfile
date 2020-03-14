# fuzzing-competition reference build of ffmpeg4.2 based on ubuntu:16.04

FROM ubuntu:16.04
LABEL maintainer="Long Zhang <longz@kth.se>"

# install dependencies
RUN apt-get update -qq && \
  apt-get -y install autoconf build-essential curl g++ git vim && \
  apt-get clean all

WORKDIR /root/

# statically build ffmpeg
RUN git clone https://github.com/gluckzhang/ffmpeg-build-script.git
RUN cd ./ffmpeg-build-script && \
  git checkout enable-debug && \
  AUTOINSTALL=yes ./build-ffmpeg --build

CMD ["bash"]
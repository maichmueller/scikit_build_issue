# Development docker environment
#
# Build:
#   docker image build -t IMAGE_NAME -f Dockerfile .


FROM ubuntu:20.04

SHELL ["/bin/bash", "-c"]
# install sys requirements
RUN apt-get update && apt-get upgrade -y \
    && apt-get install -y gnupg software-properties-common

RUN apt-get update \
  && apt-get install -y ssh \
      build-essential \
      ccache \
      clang \
      cmake \
      curl \
      gcc-10 \
      gcc-9 \
      gcc-8 \
      g++-10 \
      g++-9 \
      g++-8 \
      gdb \
      git \
      python3-dev \
      python3.8 \
      python3-distutils \
      rsync \
      tar \
      wget \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*

RUN ln -s /usr/bin/python3 /usr/bin/python

RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-10 60 --slave /usr/bin/g++ g++ /usr/bin/g++-10 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 50 --slave /usr/bin/g++ g++ /usr/bin/g++-9 \
    && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 40 --slave /usr/bin/g++ g++ /usr/bin/g++-8 \
    && yes '' | update-alternatives --force --all

RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py && python get-pip.py

RUN python -m pip install --upgrade pip \
  && pip install conan setuptools>=42 wheel pybind11 cmake scikit-build

RUN apt-get update \
  && apt-get install -y ssh doxygen \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*


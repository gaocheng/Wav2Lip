FROM nvcr.io/nvidia/cuda:10.0-cudnn7-runtime-ubuntu18.04

RUN DEBIAN_FRONTEND=noninteractive apt-get -qq update \
 && DEBIAN_FRONTEND=noninteractive apt-get -qqy install ffmpeg git less nano libsm6 libxext6 libxrender-dev \
 && rm -rf /var/lib/apt/lists/*

COPY . /app/
WORKDIR /app
RUN apt -qq update
RUN apt install -qqy apt-file
RUN apt-file update
RUN apt install -qqy software-properties-common
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt -qq update
RUN apt install -qqy python3.7 python3-pip 
RUN pip3 install --upgrade pip
RUN pip3 config set global.index-url https://mirrors.aliyun.com/pypi/simple/
RUN pip3 config set install.trusted-host mirrors.aliyun.com
RUN pip3 install -r requirements.txt

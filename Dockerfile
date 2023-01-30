FROM ubuntu:20.04


RUN apt update
RUN apt install -y make cargo flex -y

WORKDIR /home


ENTRYPOINT ["cargo", "build"]

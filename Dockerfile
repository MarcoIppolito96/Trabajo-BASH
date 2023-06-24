FROM ubuntu
MAINTAINER Marco Ippolito, Román Vázquez Ruiz Díaz

RUN apt-get update && apt-get install -y wget imagemagick
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

RUN mkdir /opt/procesador
COPY ./ /opt/procesador
CMD /opt/procesador/menu.sh
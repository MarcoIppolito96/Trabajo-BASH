FROM ubuntu
MAINTAINER Marco Ippolito, Román Vázquez Ruiz Díaz

# Instalación de paquetes necesarios
RUN apt-get update && apt-get install -y wget imagemagick
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Se crea un directorio en el cual se montará el directorio raíz
RUN mkdir /opt/procesador
VOLUME /opt/procesador
WORKDIR /opt/procesador
CMD [ "bash", "menu.sh" ]
FROM ubuntu
MAINTAINER Marco Ippolito, Román Vázquez Ruiz Díaz

# Instalación de paquetes necesarios
RUN apt-get update && apt-get install -y wget imagemagick
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Se crea un directorio en el cual se montará el directorio raíz
RUN mkdir /opt/procesador
WORKDIR /opt/procesador

# Se establece la ruta en donde se montará el directorio.
VOLUME /opt/procesador
CMD [ "bash", "menu.sh" ]
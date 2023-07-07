FROM ubuntu
MAINTAINER Marco Ippolito, Román Vázquez Ruiz Díaz

# Instalación de paquetes necesarios.
RUN apt-get update && apt-get install -y wget imagemagick
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Se crea un directorio en el cual se copiarán los archivos necesarios.
RUN mkdir /opt/procesador
WORKDIR /opt/procesador
COPY ./ ./

# Se monta el directorio de salida.
VOLUME /opt/procesador/salida
CMD [ "bash", "menu.sh" ]
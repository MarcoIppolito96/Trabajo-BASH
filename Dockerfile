FROM ubuntu
MAINTAINER Marco Ippolito, Román Vázquez Ruiz Díaz

# Instalación de paquetes necesarios.
RUN apt-get update && apt-get install -y wget imagemagick
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Variables de entorno.
ENV DIR_PROCESADOR "/opt/procesador"
ENV DIR_TEMPORAL ".tmp"
ENV ARCHIVO_SALIDA="imagenes.tar.gz"

# Se crea un directorio en el cual se copiarán los archivos necesarios.
RUN mkdir $DIR_PROCESADOR
WORKDIR $DIR_PROCESADOR

# Se monta el directorio de salida.
VOLUME $DIR_PROCESADOR
#VOLUME $DIR_PROCESADOR/salida
#CMD [ "bash", "menu.sh" ]
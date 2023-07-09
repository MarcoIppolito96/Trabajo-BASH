FROM ubuntu
MAINTAINER Marco Ippolito, Román Vázquez Ruiz Díaz

# Instalación de paquetes necesarios.
RUN apt-get update && apt-get install -y wget 7zip imagemagick
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Variables de entorno.
ENV DIR_PROCESADOR "/opt/procesador"
ENV DIR_TEMPORAL ".tmp"
ENV IMAGENES="imagenes"
ENV DIR_SALIDA="$DIR_PROCESADOR/salida"

# Se crea un directorio en el cual se copiarán los archivos necesarios.
RUN mkdir $DIR_PROCESADOR
WORKDIR $DIR_PROCESADOR
#COPY ./ ./

# Se monta el directorio de salida.
VOLUME $DIR_PROCESADOR
#VOLUME $DIR_PROCESADOR/salida
#CMD [ "bash", "menu.sh" ]
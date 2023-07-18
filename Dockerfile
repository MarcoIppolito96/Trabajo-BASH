FROM ubuntu
MAINTAINER Marco Ippolito, Román Vázquez Ruiz Díaz

# Instalación de paquetes necesarios.
RUN apt-get update && apt-get install -y wget 7zip imagemagick
RUN apt-get clean
RUN rm -rf /var/lib/apt/lists/*

# Variables de entorno.
ENV DIR_RAIZ "/opt/procesador"
ENV DIR_TEMPORAL "$DIR_RAIZ/.tmp"
ENV IMAGENES="$DIR_RAIZ/imagenes"
ENV SUMA="$IMAGENES.sha256"
ENV DIR_SALIDA="$DIR_RAIZ/salida"

# Se crea un directorio en el cual se copiarán los scripts necesarios.
RUN mkdir $DIR_RAIZ

# Se establece el directorio creado como directorio de trabajo.
WORKDIR $DIR_RAIZ

# Se copian los scripts.
COPY --chmod=0777 scripts ./

# Se monta el directorio de salida.
VOLUME $DIR_RAIZ/salida

# Se ejecuta el menú.
CMD [ "bash", "menu.sh" ]

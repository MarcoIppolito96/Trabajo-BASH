# Trabajo Práctico Final - Entorno de Programación - TUIA

Procesador de imágenes.

## Integrantes

- Marco Jose Ippolito
- Román Vázquez Ruiz Díaz

---

### Dependencias

- Docker

### Instalación

Clonar el repositorio:

```console
$ git clone https://github.com/romanvrd/tp-entorno
$ cd tp-entorno
```

### Uso

Construir y ejecutar la imagen de Docker:

```console
# docker build -t <nombre-de-la-imagen> .
# docker run -it --rm -v ./salida:/opt/procesador/salida <nombre-de-la-imagen>
```

Al ejecutar la imagen, se presentará un menú y se pedirá elegir una opción.

#### Opciones

##### 1) Generar imágenes

El programa pedirá ingresar la cantidad de imágenes que desea generar:

```console
Ingrese la cantidad de imágenes a generar. Ingrese '0' para volver al menú: <n>
```

Luego de ingresar la cantidad deseada, el programa generará las imágenes:

```console
Generando imágenes...
...
Imágenes generadas. Comprimiendo...
Las imágenes fueron generadas y comprimidas exitosamente.
Presione Enter para volver al menú.
```

##### 2) Descargar imágenes

El programa pedirá el link de un archivo que contenga las imágenes a ser procesadas:

```console
Ingrese el link del archivo comprimido a descargar. Ingrese '0' para volver al menú: <link-archivo>
```

Y el link que contenga la suma de verificación de dicho archivo:

```console
Ingrese el link de la suma de verificación. Ingrese '0' para volver al menú: <link-suma>
```

Luego de ingresar los links, el programa descargará los archivos:

```console
Descargando el archivo con las imágenes...
...
Descargando el archivo con la suma de verificación...
...
Comprobando la suma de verificación del archivo...
El archivo fue descargado y comprobado exitosamente.
Presione Enter para volver al menú.
```

###### Links de prueba

- [Imágenes](https://0x0.st/Hjmo.bin)

- [Suma de verificación](https://0x0.st/HjmH.sha256)

##### 3) Descomprimir, procesar y comprimir las imágenes

El programa descomprimirá las imágenes generadas/descargadas y procesará aquellas que tengan un nombre válido (comienzan con mayúscula y continúan con minúsculas).

```console
Las imágenes fueron descomprimidas exitosamente.
Procesando imágenes... (1/n)
Procesando imágenes... (2/n)
...
Procesando imágenes... (n/n)
Las imágenes fueron procesadas.
```

Luego generará una lista con todos los nombres de las imágenes, una lista sólo con los nombres válidos, y un archivo con la cantidad de nombres que terminen con 'a'. Todos estos archivos e imágenes se harán disponibles en la carpeta `salida` dentro de un archivo comprimido.

```console
Comprimiendo las imágenes...
Las imágenes fueron comprimidas. El archivo de salida se encuentra en la carpeta 'salida'.
Presione Enter para volver al menú.
```

##### 0) Salir

Sale del programa y finaliza la ejecución del contenedor.

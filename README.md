# Trabajo Práctico Final - Entorno de Programación - TUIA

Procesador de imágenes.

## Integrantes

- Marcos Ippolito
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
# docker build -t tp-entorno .
# docker run -it -v ./salida:/opt/procesador/salida tp-entorno
```
Opcionalmente ejecutar con la opción `--rm` para eliminar automáticamente el contenedor luego de haberlo ejecutado.

### Opciones

#### 1) Generar imágenes

#### 2) Descargar imágenes

##### Links de prueba

###### Imágenes

- https://0x0.st/Hjmo.bin

###### Suma de verificación

- https://0x0.st/HjmH.sha256

#### 3) Descomprimir, procesar y comprimir las imágenes
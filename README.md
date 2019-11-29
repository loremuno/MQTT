# MQTT
Este repositorio contiene el codigo en Matr para poder levantar una aplicacion que se conecta a un broker MQTT, para posteriormente transferir datos entre la app y el dispositivo iot

# Practica MQTT

Esta aplicacion es un fork de la aplicacion SASE para practica de conexion a mosquitto

### Pre requisitos

Debes tener instalado mosquitto en tu maquina. Para eso debes ingresar al siguiente link https://mosquitto.org/download/

Instalar Open SSL desde el siguiente link https://www.openssl.org/source/



### Uso


Para mandar datos a la app se debe correr el siguiente comando por cmd o alguna terminal o consola del sistema operativo:

```
mosquitto_pub -h a2sq3y7mdrjtom.iot.us-east-1.amazonaws.com -p 8883 -t nombre_topico -–cert ruta/certificado.pem -–key ruta/key.private.txt –-cafile ruta/rootCA.pem -m 'mensaje_JSON'
```

En nuestro caso el mensaje JSON debiese ser por ejemplo:

```
'{"temp":10.0,"hum":10.0}'
```

### Proyecto

El proyecto contiene comentarios a lo largo de su codigo para un mejor entendimiento

## Autores

- Ana Diedrichs

- Lorenzo Muñoz

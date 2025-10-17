FROM maven:3.9.6-eclipse-temurin-17
WORKDIR /app

LABEL maintainer="apino"
LABEL builder="custom-springboot-builder"

RUN echo "Imagen personalizada de Alejandro cargada correctamente" > /builder-info.txt

# Opcional: mostrar el mensaje al inicio de cada job
CMD cat /builder-info.txt && bash
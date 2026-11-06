# Paso 1: Compilar la aplicación usando Maven con JDK 17
FROM maven:3.9.6-eclipse-temurin-17 AS builder
WORKDIR /app
COPY . .
RUN mvn clean package -DskipTests

# Paso 2: Servidor Apache Tomcat 10 (Requerido para Jakarta EE 10)
FROM tomcat:10.1-jdk17-temurin

# Limpiar aplicaciones por defecto de Tomcat
RUN rm -rf /usr/local/tomcat/webapps/*

# Copiar el WAR generado (Libreria-1.0.war) a la raíz del servidor
COPY --from=builder /app/target/Libreria-1.0.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080

CMD ["catalina.sh", "run"] 
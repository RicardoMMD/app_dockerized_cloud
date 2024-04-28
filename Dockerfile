FROM rocker/shiny-verse


# Instalar paquetes de R requeridos
RUN R -e "install.packages(c('tidyverse'))"

# Copiar la aplicación al directorio de la aplicación en el contenedor
COPY . /srv/shiny-server/
COPY shiny-server.conf /etc/shiny-server/shiny-server.conf

RUN chown shiny:shiny /srv/shiny-server/

# Configurar permisos en caso de que sea desarrollado desde windows
RUN chmod -R 755 /srv/shiny-server/

EXPOSE 8080

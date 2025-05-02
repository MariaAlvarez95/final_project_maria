# Usa la imagen base de rocker/tidyverse
FROM rocker/tidyverse:latest

# Establecer el directorio de trabajo
WORKDIR /final

# Copiar solo los archivos esenciales primero (optimización del caché)
COPY renv.lock renv/activate.R renv/settings.dcf ./
RUN mkdir -p renv

# Instalar dependencias del sistema
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgdal-dev \
    libproj-dev \
    libudunits2-dev \
    gdal-bin && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Restaurar dependencias con renv
RUN Rscript -e "install.packages('renv')"
RUN Rscript -e "renv::restore()"

# Copiar el resto del proyecto
COPY . .

# Comando por defecto al iniciar el contenedor
CMD ["make", "all"]


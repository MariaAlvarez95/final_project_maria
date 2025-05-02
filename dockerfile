# Use the tidyverse image as base
FROM rocker/tidyverse:latest

# Set working directory
WORKDIR /final

# Install system dependencies
RUN apt-get update && apt-get install -y --no-install-recommends \
    libgdal-dev \
    libproj-dev \
    libudunits2-dev \
    gdal-bin && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install required R packages
RUN R -e "install.packages(c('knitr', 'rmarkdown', 'here', 'ggplot2', 'gtsummary', 'dplyr', 'readr', 'labelled', 'tidyr'), repos='https://cloud.r-project.org/')"

# Create necessary directories
RUN mkdir -p output report

# Copy project files
COPY . .

# Make sure output and report directories exist
RUN mkdir -p output report

# Default command to generate and copy the report
CMD Rscript code/01_make_table1.R && \
    Rscript code/02_make_figure1.R && \
    Rscript code/03_render_report.R && \
    cp maria_report.html report/ && \
    echo "Report generated successfully! Find it in the mounted report directory."


FROM rocker/rstudio:4.4.1

# System dependencies
RUN apt-get update && apt-get install -y \
    libssl-dev \
    libcurl4-openssl-dev \
    libxml2-dev \
    && rm -rf /var/lib/apt/lists/*

# Install R packages
RUN R -e "install.packages(c('renv', 'devtools', 'tidyverse', 'rmarkdown'), repos = 'https://cloud.r-project.org/')"

# Set working directory
WORKDIR /home/rstudio/project

# Copy project files
COPY . /home/rstudio/project/
RUN chown -R rstudio:rstudio /home/rstudio/project

# Initialize renv
RUN R -e "renv::consent(provided = TRUE); if (!file.exists('renv/activate.R')) renv::init()"

# Expose RStudio port
EXPOSE 8787

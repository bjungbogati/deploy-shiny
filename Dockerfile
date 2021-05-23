# get shiny server and R from the rocker project
FROM rocker/r-ver:4.1.0

# system libraries
# Try to only install system libraries you actually need
# Package Manager is a good resource to help discover system deps
RUN apt-get update && apt-get install -y \
libcurl4-gnutls-dev \
libssl-dev \
libxml2-dev \
libudunits2-dev \
libssh2-1-dev \
libsasl2-dev \
libv8-dev \
libudunits2-dev \
libgdal-dev \
libgeos-dev \
libproj-dev

COPY .  /home/survey_app

# make all app files readable (solves issue when dev in Windows, but building in Ubuntu)
RUN chmod -R 755 /home/survey_app && chmod -R 777 /tmp

# expose port on Docker container
EXPOSE 4041

# install R packages required

RUN R -e "options(Ncpus = 4, repos='https://packagemanager.rstudio.com/all/__linux__/focal/3018940'); if(!require(pacman)) {install.packages('pacman')}; pacman::p_load(devtools, ragg, shiny, bs4Dash, tidygeocoder, googlesheets4, dplyr, leaflet, ggplot2, htmltools, firebase); devtools::install_github('bbc/bbplot');"

# run app.R as localhost and on exposed port in Docker container

CMD ["R", "-e", "shiny::runApp('/home/survey_app/', host='0.0.0.0', launch.browser = F, port=4042)"]




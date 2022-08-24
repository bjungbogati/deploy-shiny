# Deploy R Shiny project

### Encryption

https://community.cloudflare.com/t/lets-encrypt-and-cloudflare-how-to-set/66442/13

source ~/.bashrc

JAVA_HOME=/usr/lib/jvm/java-13-oracle
PATH=$PATH:$HOME/bin:$JAVA_HOME/bin
export JAVA_HOME
export JRE_HOME
export PATH
https://www.r-bloggers.com/2018/02/installing-rjava-on-ubuntu/


### docker push

sudo docker login
sudo docker images
sudo docker tag covid19api:latest  bjungbogati/devimg
sudo docker images
sudo docker push bjungbogati/devimg


# Config Nginx

sudo htpasswd -c /etc/nginx/conf.d/.htpasswd

### Http Auth
---- 
auth_basic   		"Restricted Access!";
auth_basic_user_file 	/etc/nginx/conf.d/.htpasswd; 


#### Error /Acess log
---------------------------------------------
access_log /var/www/logs/nepal_dash.access.log;
                error_log /var/www/logs/nepal_dash.error.log;

### Edit Nginx config
------------------------------------------
cd /etc/nginx/sites-enabled/
cd /etc/nginx/sites-available/
sudo nano default

sudo nano /etc/nginx/sites-enabled/default
sudo nginx -t

sudo service nginx restart

ln -s /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

sudo nano /etc/nginx/sites-enabled/default
rm /etc/nginx/sites-enabled/default.save


### Add http proxy config for Nginx
Add following:

ls
      proxy_pass http://localhost:3838;
      proxy_http_version 1.1;
      proxy_set_header Upgrade $http_upgrade;
      proxy_set_header Connection $connection_upgrade;
      proxy_read_timeout 20d;
      proxy_buffering off;

sudo service nginx restart



http {
    map $http_upgrade $connection_upgrade {
        default upgrade;
        ''      close;
    }



### Volume Mount docker
---------------------------------------------------------------------------------------------


sudo docker -d -v  -i -t /home/panmgmt/nepal-map:/home/nepal-map
sudo docker -d -v  -i -t /home/panmgmt/unhabitat_project:/home/unhabitat_app
sudo docker -d -v  -i -t /home/panmgmt/training_survey:/home/training_survey

Server VALUE CHANGE
--------------------------------------------------------

# sed -i -e 's/\blisten 3838\b/listen 4042/g' /etc/shiny-server/shiny-server.conf && \


Resources LIMIT
---------------------------------------
sudo docker run -it --memory="1g" --memory-swap="2g" --cpus-shares="700" ubuntu


## Start RSTUDIO SERVER
----------------------------------------------------------------
sudo docker run -it --memory="1g" -d -v /home/panmgmt/Rpackages/:/home/rstudio/Rpackages --rm -p 8787:8787 --name rstudio_server -e PASSWORD=password -e USERID=$(id -u) -e GROUPID=$(id -g) bjungbogati/rstudio_server:latest
sudo docker run -it --memory="1g" -d -v /home/panmgmt/Rpackages/:/home/rstudio/Rpackages --rm -p 8787:8787 --name rstudio_server -e PASSWORD=password -e USERID=$(id -u) -e GROUPID=$(id -g) bjungbogati/rstudio_server:latest
sudo docker run -it --memory="1g" -d -v /home/panmgmt/Rpackages/:/home/rstudio/Rpackages --rm -p 8889:8787 --name rstudio_server -e PASSWORD=password -e USERID=$(id -u) -e GROUPID=$(id -g) bjungbogati/rstudio_server:server3

#### Orphan Viz
sudo docker run -it -d -v /home/panmgmt/Rpackages/:/home/rstudio/Rpackages --rm -p 8787:8787 --name rstudio_server -e PASSWORD=wisemd -e USERID=$(id -u) -e GROUPID=$(id -g) bjungbogati/rstudio_server:latest

gitcreds::gitcreds_set()


### Server Prod
----------------------------------------------------------
sudo docker -v /home/panmgmt/nepal_app:/home/nepal_app

### Docker Image remove 
----------------------------------------------------------

sudo docker rmi 993df4a57e1b

## tag with none remove images
docker image prune --filter="dangling=true"

Docker container remove
-----------------------------------------------------------

sudo docker rm --force 993df4a57e1b
--------------------------------------------------------

### Volume mount
======================================================

sudo docker run --name=nepal-map -d -v /home/panmgmt/nepal_map/bhk_map_demo:/home/nepal_map -p 3838:3838 nepal-map

docker run -it -v "$(pwd)":/path/to/folder image-name

docker run -it -v "$(pwd)":/srv/shiny-server 


sudo docker run --name=latest -d -v /home/panmgmt/training_survey:/home/training_survey --rm -p 4041:4041 training_survey

sudo docker run --name=latest -d -v /home/panmgmt/training_survey:/home/training_survey --rm -p 4042:4042 training_survey


sudo docker run --name=latest -d --rm -p 4042:4042 deploy-shiny

docker exec -ti container_name sh


### Build Run docker
-----------------------------------------------------------------------------------------------
sudo docker build -t training_survey ./
sudo docker run -d --name=latest --rm -p 4042:4042 training_survey


sudo docker build -t bhk_dash2 ./
sudo docker run -d --name=nepal_map --rm -p 3838:3838 nepal_map

sudo docker build -t unhabitat_app ./
sudo docker run -d --name=unhabitat_app --rm -p 4040:4040 unhabitat_app


### Build twitter bot

sudo docker build -t twitter_bot ./
sudo docker tag twitter_bot:latest bjungbogati/vaccinenepal
sudo docker push bjungbogati/vaccinenepal

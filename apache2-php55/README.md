apache2-php55
==================

Usage
-----

Checkout the project :

        git clone https://github.com/sfauvart/docker.git
        cd docker/apache2-php55

Then, to create the image `sebf/apache2-php55`, execute the following command on the apache2-php55 folder:

        docker build -t sebf/apache2-php55 .

To run the image, link a mysql & mailcatcher container and bind to port 80:

        docker run -d --name apache-1 --link mysql1:db1 --link mailcatcher:smtp -v /home/sebf/workspace_cloud9_1:/var/www/html -p 127.0.0.1:8001:80 sebf/apache2-php55

Now you can open your favorite browser and go to the URI 127.0.0.1:8001 !

Done!


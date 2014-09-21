docker-mailcatcher
==================

Usage
-----

Checkout the project :

        git clone https://github.com/sfauvart/docker.git
        cd docker/mailcatcher

Then, to create the image `sebf/mailcatcher`, execute the following command on the docker-mailcatcher folder:

        docker build -t sebf/mailcatcher .

To run the image, link mailcatcher container and bind to port 80 & 443:

        docker run -t -d --name mailcatcher -p 1025:1025 -p 1080:1080 sebf/mailcatcher

Now you can open your favorite browser and go to the URI 127.0.0.1:1080 to check emails !

Done!


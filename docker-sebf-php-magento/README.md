docker-sebf-php-magento
=======================

Docker image base for apache php configuration to install magento

Usage
-----

To create the image `sebf/php-magento`, execute the following command on the docker-sebf-php-magento folder:

        docker build -t sebf/php-magento .

To run the image and bind to port 80:

        docker run -d -p 80:80 sebf/php-magento

		docker run -t -d --name magento -p 80:80 -v $(pwd)/php-app:/app sebf/php-magento
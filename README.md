# docker-owncloud

Docker container for [Owncloud 8.0][3]

"OwnCloud Server 8.0 Access your data from all your devices, on an open platform you can extend and modify."

## Install dependencies

  - [Docker][2]

To install docker in Ubuntu 14.04 use the commands:

    $ sudo apt-get update
    $ sudo apt-get install docker.io

 To install docker in other operating systems check [docker online documentation][4]

## Usage

To run container use the command below:

    $ docker run -d -p 443:443 -e C=US -e ST=New Hampshire -e L=Manchester -e O=owncloud -e OU=Docker-Dev -e CN=oc.YourDomain.com rootwzrd/owncloud

The -e is to provide the varialbles values for the SSL generation of .key and .pem file; please change the values for your specific location and info.

## Accessing the Owncloud applications:

After that check with your browser at addresses plus the port 443:

  - **http://host_ip:443/**

To access the container from the server that the container is running :

    $ docker exec -it container_id /bin/bash

## More Info

About Owncloud 8 [doc.owncloud.org][1]

To help improve this container [docker-owncloud][5]

[1]:http://doc.owncloud.org
[2]:https://www.docker.com
[3]:https://owncloud.org/install
[4]:http://docs.docker.com
[5]:https://github.com/rootwzrd/owncloud





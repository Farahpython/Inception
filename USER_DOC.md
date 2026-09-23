# User Documentation 📁

This project aims to guide uses on how to launch a WordPress website using a minimal set of connected services. The services provided by the stack include:
- **NGINX** ->  The web server, recieves requests from the web browser.
- **WordPress** ->  application server, runs the WordPress application.
- **Mariadb** -> database server for storing and processing data.

##  Start and stop the activity ⌨️
To start the activity and build images:
>make build

To start the containers:
>make up

To stop the containers:
>make down

To remove the containers and images: 
>make clean

To remove containers, images, and named volumes (full tear-down): 
>make fclean

##  Access website and administration panel 
To access the website:
>make website

To access the login page:
>make login

To access the administration panel:
>make admin
---

##  Locate and manage credentials 📝

The passwords used by this project (for the website administrator
account, the regular user account, and the database) are stored in
individual text files inside a folder called `secrets/`, located in
the main project folder.

**Important:** these files contain sensitive information and should
never be shared, published, or uploaded anywhere public (such as
GitHub). They are intentionally excluded from the project's version
control for this reason.

Usernames (which are not sensitive) are stored separately, in a file
called `.env` in the project folder

### How to check that the services are running correctly?

The simplest way to check the website is working is to visit it
in a browser with the following command:
>make website

If the page loads normally, everything is working correctly.

To list currently running containers:
>docker ps

To list all containers, including any that have stopped unexpectedly:
>docker ps --all

(if a container isn't listed as "Up," something has gone wrong)

To see detailed information about a specific container:
>docker inspect <container_name>

To see what a specific container has been doing, and check for errors:
>docker logs <container_name>

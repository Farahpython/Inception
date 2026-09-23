*This activity has been created as part of the 42 curriculum by fadarwis.*

### Description

**Inception** is a project that introduces Docker,a software platform that delivers software in **containers**.
Containers are lightweight packages that contain an application and everything it needs to run.
Containers are also running instances of an **Image**, a read-only template that contains the files (libraries, dependencies, config)
and startup instructions to run a piece of software. While Docker is a kind of virtualization, it’s different from regular Virtual Machines (VMs).

**Benefits of Docker:**

1. simplifies the process of sharing code.
2. works across multiple environments, platforms, and operating systems.
3. allows developers to work in standardized environments using local containers.

The goal of this project is to deploy a WordPress website inside a virtual machine, following a three-tier architecture
where each tier runs in its own isolated Docker container:

- **Tier 1 (web server)** → NGINX: handles HTTPS and forwards requests
- **Tier 2 (application)** → WordPress + php-fpm: runs the site's PHP logic
- **Tier 3 (data)** → MariaDB: stores the site's data

Rather than installing everything directly on the VM, each service is built and run as its own container,
giving isolation, reproducibility, and independent lifecycle management.

### Instructions

To build the Images of all services:
> make build

To start the containers all services:
> make up

To open the website's login page:
> make login

To stop the running containers:
> make down

To stop and remove the containers, and remove all the Docker images:
> make clean

To stop the containers and remove the named volumes:
> make fclean

### Resoucres

**Docker Cheat Sheet**:
- https://docs.docker.com/get-started/docker_cheatsheet.pdf
**For reading**:
- https://www.reddit.com/r/docker/comments/keq9el/please_someone_explain_docker_to_me_like_i_am_an/
- https://www.techtarget.com/it-infrastructure/definition/Docker-image
- https://medium.com/@rashmikanethsarani119/docker-data-persistence-understanding-volumes-vs-bind-mounts-be65af175eb0
**Docker installation**:
-  https://docs.sevenbridges.com/docs/install-docker-on-linux
**NGINX configuration**:
-  https://www.solo.io/topics/nginx/nginx-configuration
-  https://nginx.org/en/docs/http/ngx_http_ssl_module.html#example
**Difference between RUN and CMD in a Dockerfile**:
-  https://stackoverflow.com/questions/37461868/difference-between-run-and-cmd-in-a-dockerfile
**mariadb**:
- https://hub.docker.com/_/mariadb

**WordPress**:
- https://blog.hubspot.com/website/wp-cli
- https://www.theistudio.com/where-are-wordpress-files-stored/ 
- https://developer.wordpress.org/cli/commands/core/download/
- https://developer-wordpress-org.translate.goog/cli/commands/config/create/?_x_tr_sl=en&_x_tr_tl=ar&_x_tr_hl=ar&_x_tr_pto=sc 
- https://steveperkins.com/running-wordpress-on-docker-the-definitive-guide/
- https://docs.ovhcloud.com/en/guides/bare-metal-cloud/virtual-private-servers/install-wordpress-docker-on-vps
- https://www.digitalocean.com/community/tutorials/how-to-install-wordpress-with-lemp-on-ubuntu-22-04

**Docker Compose**:
- https://prohoster.info/en/blog/administrirovanie/docker-compose-uproshhenie-raboty-s-ispolzovaniem-makefile
**Docker Secrets**:
- https://www.wiz.io/academy/container-security/docker-secrets

### Additional Project Description
**Virtual Machines vs Docker**
-> **Virtual Machines**: the complete simulation of the computer hardware that provides an isolated environment
on host hardware with minimal OS installation.
-> **Docker**: containerization platform that develops, ships, and runs applications on containers,
these containers are run as isolated processes directly on top of the host operating system. They package only the application
code and its specific dependencies rather than an entire operating system. 

**Secrets vs Environment Variables**
 -> **Secrets**: a security mechanism implemented by docker to store sensitive information such as passwords, API keys, and SSH private credentials.
 - Secrets are created and managed separately from applications. By default, secrets are mounted only by the containers that need 
 them and automatically unmounted when the containers stop.
 - Secrets are encrypted both at rest and in transit.
 -> **Environment Variables**: are non-sensitive configuration settings and are often available to all processes. 

**Docker Network vs Host Network**
**Docker Network**: docker containers share the host's network stack directly, eliminating network isolation between container and host.  
**Host Network**: containers run in an isolated network namespace and require explicit port mapping to communicate with external systems.

**Docker Volumes vs Bind Mounts**
**Docker Volumes**: mechanism for storing data outside containers. All volumes are managed by Docker and stored in a dedicated directory on your host, usually /var/lib/docker/volumes for Linux systems.Volumes are designed to support the deployment of stateful Docker containers. 
**Bind Mounts**: a specific folder on the host machine is linked to a folder inside the container.

# Developer documentation 💻

This project aims to demonstrate how docker solves the "But it works on my machine" dilemma.

### Prerequisites
- A Linux virtual machine (this project was built/tested on [your Debian version])
- Docker Engine and Docker Compose installed (see: https://docs.docker.com/engine/install/)

### Configuration files
Before running the project, the following need to be in place:

- `srcs/.env`: contains non-sensitive configuration (domain name,
  database name, usernames, user email). 
- `secrets/` — a folder containing the following files, each holding
  a single password with no extra formatting:
  - `db_root_password.txt`
  - `db_password.txt`
  - `wp_admin_password.txt`
  - `wp_user_password.txt`

Neither `.env` nor `secrets/` are committed to version control, they must be created manually before first use.

### Build and launch the activity using the Makefile and Docker Compose

This project uses a Makefile to wrap the underlying `docker compose` commands:

To build the Images of all services:
> make build

To start the containers all services:
> make up

Once running, you can quickly open specific pages in your browser:

    make website   — opens the main website
    make login     — opens the login page
    make admin     — opens the admin panel

To stop the running containers:
> make down

To stop and remove the containers, and remove all the Docker images:
> make clean

To stop the containers and remove the named volumes:
> make fclean

### Use relevant commands to manage the containers and volumes

## Managing Containers and Volumes

## Containers

List currently running containers:
>docker ps

List all containers, including stopped ones:
>docker ps --all

Start or stop an existing container:
>docker start <container_name>
    docker stop <container_name>

Remove a stopped container:
>docker rm <container_name>

Open a shell inside a running container:
>docker exec -it <container_name> sh

Fetch and follow a container's logs live:
>docker logs -f <container_name>

Inspect detailed information about a container:
>docker inspect <container_name>

View live resource usage (CPU, memory, network) per container:
>docker container stats

## Volumes

List all Docker volumes:
>docker volume ls

Inspect a specific volume's details, including its host path:
>docker volume inspect <volume_name>

Remove a specific volume (only when not in use, this permanently
deletes its data):
>docker volume rm <volume_name>


### Identify where the activity data is stored and how it persists 📁

**`mariadb_data`** (physically at `/home/fadarwis/data/mariadb`): Contains MariaDB's actual database files, including the `wordpress` database. Every blog post, page, comment, user account, and site
setting is stored here as structured database tables.

**`wp_data`** (physically at `/home/fadarwis/data/wordpress`): Contains WordPress's core application files, its generated configuration (`wp-config.php`), and most importantly for persistence, the `wp-content/uploads` folder, which holds every image or file uploaded through the site.

Because named volumes are separated from the container's file system and the data is physically stored on disk, even if images are deleted and rebuilt, the data is still reserved.

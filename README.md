Impyr.io - Docker Image
=======================

Docker Container for Impyr.io Instances.

## Tech Stack

This image consists of the following tech stack:

 * [Alpine Linux](https://alpinelinux.org/) base platform.
 * [NGINX](https://www.nginx.com/) web/application server.
 * [Node.js](https://nodejs.org/) scripting environment.

## Testing Setup

Follow these steps to start a local Impyr.io instance for testing:

 1. Install Docker on your local machine.
 2. Clone this repository.

        cd «/path/to/projects»
        git clone https://github.com/impyrio/docker.git
 3. Build this container:

        docker build -t impyr.io .
 4. Start the container

        docker start impyr.io
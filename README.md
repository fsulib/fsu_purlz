# fsu_purlz
Scripts for building and deploying a [PURLZ](http://www.purlz.org/) with Docker.

# Repo Contents
- `/Dockerfile`: Dockerfile for defining the container image.
- `/purlz.env`: Set of environmental variables to customize build & deployment.
- `/default.purlz.config`: A basic config file containing variables that will get swapped in `/build.sh` to turn it into `xform.purlz.config`, which is what actually gets used.
- `/build.sh`: Bash script for building a container image from the `/Dockerfile`.
- `/deploy.sh`: Bash script for deploying the container and mounting `/purlz_data`.
- `/purlz_data`: An empty directory that gets mounted to the host in `/deploy.sh` so you can keep your HSQLDB data outside of the container.

# Usage
Download this repo, set your envars in `/purlz.env`, run `/build.sh` to create a custom container image, and then run `/deploy.sh` to launch it and try it out.

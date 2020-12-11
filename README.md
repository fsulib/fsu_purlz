# fsu_purlz
Scripts for building and deploying a [PURLZ](http://www.purlz.org/) container.

# Repo Contents
- `fsu_purlz/Dockerfile`: Dockerfile for defining the container image.
- `fsu_purlz/purlz.env`: Set of environmental variables to customize build & deployment.
- `fsu_purlz/build.sh`: Bash script for building a container image from the `fsu_purlz/Dockerfile`.
- `fsu_purlz/deploy.sh`: Bash script for deploying the container and mounting `fsu_purlz/purlz_data`.
- `fsu_purlz/*.purlz.config`: A basic config file containing variables that will get swapped in `fsu_purlz/build.sh` to turn it into `xform.purlz.config`, which is what actually gets used.
- `fsu_purlz/*_data`: An empty directory that gets mounted in `fsu_purlz/deploy.sh` so you can keep your database data outside of the container.

# Usage
Download this repo, set your envars in `fsu_purlz/purlz.env`, run `fsu_purlz/build.sh` to create a custom container image, and then run `fsu_purlz/deploy.sh` to launch it and try it out.

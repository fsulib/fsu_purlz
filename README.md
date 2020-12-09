# fsu_purlz
Scripts for building and deploying a [PURLZ](http://www.purlz.org/) container.

# Repo Contents
- `fsu_purlz/Dockerfile`: Dockerfile for defining the container image.
- `fsu_purlz/purlz.env`: Set of environmental variables to customize build & deployment.
- `fsu_purlz/default.purlz.config`: A basic config file containing variables that will get swapped in `fsu_purlz/build.sh` to turn it into `xform.purlz.config`, which is what actually gets used.
- `fsu_purlz/build.sh`: Bash script for building a container image from the `fsu_purlz/Dockerfile`.
- `fsu_purlz/deploy.sh`: Bash script for deploying the container and mounting `fsu_purlz/purlz_data`.
- `fsu_purlz/purlz_data`: An empty directory that gets mounted to the host in `fsu_purlz/deploy.sh` so you can keep your HSQLDB data outside of the container.

# Usage
Download this repo, set your envars in `fsu_purlz/purlz.env`, run `fsu_purlz/build.sh` to create a custom container image, and then run `fsu_purlz/deploy.sh` to launch it and try it out.

# Backups
This PURLZ server is configured to use HyperSQL (HSQLDB) for data storage, and the files that HSQLDB stores data in are mounted to the host at `fsu_purlz/purlz_data` so that they can easily be backed up, with the most convenient method being to create a zip file of `fsu_purlz/purlz_data/*`. 

If you would like to restore the PURLZ server using a previously created backup, simply: 
1. Stop the container
2. Delete all of the existing files in the `fsu_purlz/purlz_data` directory
3. Place files from a previously created backup in `fsu_purlz/purlz_data`
4. Start the container again
When the container resumes, it will be using the data from the previously created backup.

# fsu_purlz
Scripts for building a [PURLZ](http://www.purlz.org/) container in AWS.

# Repo Contents
- `fsu_purlz/Dockerfile`: Dockerfile that defines the container image.
- `fsu_purlz/xform-purlz-config.sh`: Shell script that substitutes CodeBuild environment variable values for placeholders in `fsu/purlz-install.config`.
- `fsu_purlz/build_tag_push.sh`: Shell script that builds, tags, and pushes the image to Elastic Container Registry.
- `fsu_purlz/purlz-install.config`: Purlz's installation configuration file.
- `fsu_purlz/module.model.xml`: Purlz's module.xml file. A regex-escaped version of purlz's external DNS should be substituted for the `_PURLZDNPATTERN_` placeholder. File mounted to purlz container at instantiation.
- `fsu_purlz/purlz.sql`: A dataless dump of the Purlz mysql database. Why not?
- `fsu_purlz/buildspec-purlz.yaml`: CodeBuild's buildspec file.

# Usage
Finding a different persistent url provider is probably your best move.

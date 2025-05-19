# postgres-image

This repo defines workflows to build and publish updated images for PostgreSQL for use with zalando/postgres-operator.
The images are from zalando/spilo, but with additional build arguments for our use.

## Plan

### Automatic builds

- Detect new tags in zalando/spilo, and update workflows to build and publish images for those tags.
- Detect new minor versions of PostgreSQL available in ubuntu (the base image used by spilo), and trigger builds when a new minor version is available.

### Deploy

- Deploy a configmap with the new image tag on each build, as a Fasit feature
- Naiserator accepts this config and will use the configured image when deploying applications that use postgres

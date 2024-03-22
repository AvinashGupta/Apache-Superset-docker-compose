#!/bin/bash

# Upgrading Superset metastore
echo_step "1" "Starting" "Applying DB migrations"
superset db upgrade
echo_step "1" "Complete" "Applying DB migrations"

# create Admin user, you can read these values from env or anywhere else possible
echo_step "2" "Starting" "Setting up admin user ( $ADMIN_USERNAME / $ADMIN_PASSWORD )"
superset fab create-admin \
                --username "$ADMIN_USERNAME" \
                --firstname Superset \
                --lastname Admin \
                --email "$ADMIN_EMAIL" \
                --password "$ADMIN_PASSWORD"
echo_step "2" "Complete" "Setting up admin user"

# setup roles and permissions
echo_step "3" "Starting" "Setting up roles and perms"
superset superset init 
echo_step "3" "Complete" "Setting up roles and perms"

# load example database
echo_step "4" "Starting" "Loading examples"
superset load_examples --force
echo_step "4" "Complete" "Loading examples"

# Starting server
/bin/sh -c /usr/bin/run-server.sh
#!/bin/bash

function enable_site() {
  SITE_NAME="$1"
  sudo cp "./nginx.sites/$SITE_NAME" "/etc/nginx/sites-available/$SITE_NAME"
  sudo ln -f -s "/etc/nginx/sites-available/$SITE_NAME" \
                "/etc/nginx/sites-enabled/$SITE_NAME"

}

sudo rm /etc/nginx/sites-available/*
sudo rm /etc/nginx/sites-enabled/*
enable_site peterdowns.com
enable_site bookshrink.com
enable_site freezine.xyz
enable_site _.default.conf

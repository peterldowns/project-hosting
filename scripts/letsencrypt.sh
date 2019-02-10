#!/bin/bash
# https://www.digitalocean.com/community/tutorials/how-to-secure-nginx-with-let-s-encrypt-on-ubuntu-16-04
set -e
sudo add-apt-repository ppa:certbot/certbot
sudo apt-get update
sudo apt-get install python-certbot-nginx

sudo certbot --nginx -d peterdowns.com
sudo certbot --nginx -d bookshrink.com
sudo certbot --nginx -d freezine.xyz

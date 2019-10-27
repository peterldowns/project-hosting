server {
  server_name peterdowns.com;

  root /home/peterldowns/project-hosting/peterdowns.com;
  index index.html;

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/peterdowns.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/peterdowns.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
  server_name www.peterdowns.com;
  return 301 $scheme://peterdowns.com$request_uri;

    listen 80; # managed by Certbot

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/peterdowns.com/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/peterdowns.com/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
  if ($host = peterdowns.com) {
      return 301 https://$host$request_uri;
  } # managed by Certbot

  listen 80;
  server_name peterdowns.com;
    return 404; # managed by Certbot
}

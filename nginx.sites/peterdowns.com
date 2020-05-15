map $sent_http_content_type $expires {
  default off;
  text/html epoch;
  text/css  max;
  application/javascript max;
  ~image/ max;
}

server {
  server_name peterdowns.com;

  root /home/peterldowns/project-hosting/peterdowns.com;
  index index.html;

  expires $expires;

  gzip on;
  gzip_static on;
  gzip_comp_level 5;
  gzip_min_length 1024;
  gzip_types text/plain text/css application/json application/javascript application/x-javascript text/xml application/xml application/xml+rss text/javascript image/jpeg image/png image/x-icon;

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

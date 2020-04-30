server {
  listen 80;
  server_name please.killme.lol;

  # Stonks Strat Guide
  rewrite ^/$ https://docs.google.com/document/d/1JY83Jl0uRGv2WuENxG_hDrqD2hKZK1fIKOnw9sd3tWw/edit;
}

server {
  listen 80;
  server_name dont.killme.lol;

  # Anti-Covid19 Strat Guide
  rewrite ^/$ https://docs.google.com/document/d/1fDVdB1cpn-3kCMGmdq4Up5fnW2HO-GSYJ1744JWf78w/edit;
}

server {
  listen 80;
  server_name zoom.killme.lol;
  rewrite ^/$ https://zoom.us/j/2524908103;
}

server {
  server_name killme.lol;
  root /home/peterldowns/project-hosting/killme.lol;
  index index.html;

  rewrite ^/secret/stonks$ https://docs.google.com/document/d/1JY83Jl0uRGv2WuENxG_hDrqD2hKZK1fIKOnw9sd3tWw/edit;
  rewrite ^/secret/covid$ https://docs.google.com/document/d/1fDVdB1cpn-3kCMGmdq4Up5fnW2HO-GSYJ1744JWf78w/edit;
  rewrite ^/zoom$ https://zoom.us/j/2524908103;


  # location / {
  #   proxy_pass http://127.0.0.1:8081;
  #   proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
  #   proxy_redirect off;
  #   proxy_buffering off;
  #   proxy_set_header Host $host;
  #   proxy_set_header X-Real-IP $remote_addr;
  #   proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  # }

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/killme.lol/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/killme.lol/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot
}

server {
  server_name www.killme.lol;
  return 301 $scheme://killme.lol$request_uri;

    listen 80; # managed by Certbot

    listen 443 ssl; # managed by Certbot
    ssl_certificate /etc/letsencrypt/live/killme.lol/fullchain.pem; # managed by Certbot
    ssl_certificate_key /etc/letsencrypt/live/killme.lol/privkey.pem; # managed by Certbot
    include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
    ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

}

server {
    if ($host = killme.lol) {
        return 301 https://$host$request_uri;
    } # managed by Certbot

  listen 80;
  server_name killme.lol;
    return 404; # managed by Certbot
}

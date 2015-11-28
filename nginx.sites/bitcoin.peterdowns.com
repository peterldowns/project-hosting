upstream web {
  least_conn;
  server 127.0.0.1:10011 fail_timeout=20s;
  server 127.0.0.1:10012 fail_timeout=20s;
  # server 127.0.0.1:10013 fail_timeout=20s;
  # server 127.0.0.1:10014 fail_timeout=20s;
}

upstream socket {
  # Directs to the process with least number of connections.
  ip_hash;
  server 127.0.0.1:10001 fail_timeout=20s;
  server 127.0.0.1:10002 fail_timeout=20s;
  server 127.0.0.1:10003 fail_timeout=20s;
  server 127.0.0.1:10004 fail_timeout=20s;
}
 
server {
  listen 80;
  location ^~ /socket.io/ {
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_http_version 1.1;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $host;
    proxy_pass http://socket;
  }

  location / {
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_set_header X-NginX-Proxy true;

    proxy_pass http://web;
    proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
    proxy_redirect off;
    proxy_buffering off;
  }
}

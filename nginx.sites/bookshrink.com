server {
  listen 80;
  server_name bookshrink.com;
  location / {
    proxy_pass http://127.0.0.1:8080;
    proxy_next_upstream error timeout invalid_header http_500 http_502 http_503 http_504;
    proxy_redirect off;
    proxy_buffering off;
    proxy_set_header Host $host;
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
  }
}

server {
  server_name *.bookshrink.com;
  return 302 $scheme://bookshrink.com$request_uri;
}

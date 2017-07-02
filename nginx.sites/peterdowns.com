server {
  listen 80;
  server_name peterdowns.com;

  root /home/peterldowns/project-hosting/peterdowns.com;
  index index.html;
}

server {
  server_name *.peterdowns.com;
  return 301 $scheme://peterdowns.com$request_uri;
}

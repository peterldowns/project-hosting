server {
  listen 80;
  server_name peterdowns.com;

  root /home/peterldowns/project-hosting/peterldowns.github.com;
  index index.html;
}

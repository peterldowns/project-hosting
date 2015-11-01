1. Install `haproxy` and `nginx`

```bash
./scripts/haproxy_install.sh
./scripts/nginx_install.sh
```

2. Install the config files

```bash
./scripts/haproxy_config.sh
./scripts/nginx_config.sh
```

3. Turn on the servers

```bash
sudo service nginx start
sudo service haproxy start
```

4. Turn on the backend services

```bash
cd bookshrink && make prod
```

Now visit your server on port 80!

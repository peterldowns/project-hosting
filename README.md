1. Install `haproxy` and `nginx`

```bash
./scripts/nginx_install.sh
```

2. Install the config files

```bash
./scripts/nginx_config.sh
```

3. Turn on the servers

```bash
sudo service nginx start
```

4. Turn on the backend services

```bash
cd bookshrink && make prod
```

Now visit your server on port 80!

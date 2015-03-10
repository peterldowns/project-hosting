1. Install `haproxy`

```bash
sudo apt-get install haproxy
sudo vim /etc/default/haproxy # change ENABLED=0 to ENABLED=1
```

2. Install the `haproxy` config file

```bash
sudo mv /etc/haproxy/haproxy.cfg{,.original}
sudo cp haproxy.cfg /etc/haproxy/haproxy.cfg
```

3. Turn on `haproxy` and set up the daemonized backends requried by the config.

```
sudo service haproxy start
cd bookshrink && make prod
cd cba && make prod
```

Now visit your server on port 80!

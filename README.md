# nginx stream

- https://docs.nginx.com/nginx/admin-guide/load-balancer/tcp-udp-load-balancer/

Nginx TCP/UDP load balancer

Build. Ensure your [Config](config/nginx.conf) matches your backend server name.

```bash
make podman-build
```

Test it out locally.

Run two backend pods.

```bash
podman run --name welcome1 -d --rm -p 8080:8080 quay.io/eformat/welcome:latest
podman run --name welcome2 -d --rm -p 8081:8080 quay.io/eformat/welcome:latest
```

Run nginx-stream proxy.

```bash
podman run --name nginx-stream -d --rm -p 10000:10000 -p 10001:10001 quay.io/eformat/nginx-stream:latest
```

Curl via the tcp proxy.

```bash
virt:~$ curl localhost:10000
Hello World ! Welcome to OpenShift from 27b1b4cb4a8a:

virt:~$ curl localhost:10001
Hello World ! Welcome to OpenShift from 3f46a3774e04:
```
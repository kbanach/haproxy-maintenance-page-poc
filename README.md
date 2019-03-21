HAProxy with dynamically enabled maintenance page
=================================================

A simple proof of concept, that shows implementation of the idea to turn on/off maintenance page without relaoding entire proxy.

Technologies used:

* [docker](https://www.docker.com/) (+ [docker-compose](https://docs.docker.com/compose/)) - for containerisation and orchestration
* [NodeJS](https://nodejs.org/) - for serving some simple HTML answers
* [HAProxy](http://www.haproxy.org/)

Running
-------

It is (or at least, should be) as easy as running in the root of the project:

```bash
docker-compose up
```

And then simply open the [localhost](http://localhost/) in your default browser

If all runs fine, on every refresh of the page you should see "Server one" or "Server Two" (depends on which backend answered)


Maintenance mode ON
-------------------

When `docker-compose` is running fine, in different terminal tab run:

```bash
docker ps -q --filter name="poc_proxy" | awk '{print $0" sh"}' | xargs -o docker exec -it
```

It will connect you with the proxy container. Then, inside the container paste:

```bash
echo "disable server web_backends/app1" | socat /var/run/haproxy.sock stdio
```
and
```bash
echo "disable server web_backends/app2" | socat /var/run/haproxy.sock stdio
```

If you go back to the terminal with running `docker-compose up`, you'll see log about disabling both of the backends.

When you'll go to [localhost](http://localhost/) now, you should see the response of third service: `maintenance` - this is where you can put whatever you want.


Maintenance mode OFF
--------------------

Steps are almost the same as turning maintenance on, but instead of `disable server ...` you should `enable` it:

```bash
echo "enable server web_backends/app1" | socat /var/run/haproxy.sock stdio
echo "enable server web_backends/app2" | socat /var/run/haproxy.sock stdio
```

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
./maintenanceModeOn.sh
```

If you go back to the terminal with running `docker-compose up`, you'll see log about disabling both of the backends.

When you'll go to [localhost](http://localhost/) now, you should see the response of third service: `maintenance` - this is where you can put whatever you want.


Maintenance mode OFF
--------------------

Just run:

```bash
./maintenanceModeOff.sh
```


Tech details
------------

The `maintenanceModeOn.sh`/`maintenanceModeOff.sh` scrips are just calling same named scrips inside of proxy container. Inside of them (in `haproxy-conf/maintenanceModeO*.sh`) we're using unix socket to [disable](http://cbonte.github.io/haproxy-dconv/1.9/management.html#9.3-disable%20server)/[enable](http://cbonte.github.io/haproxy-dconv/1.9/management.html#9.3-enable%20server) backends called `app1` and `app2`.

When they are unavailable, HAProxy is using the [backup server](http://cbonte.github.io/haproxy-dconv/1.9/configuration.html#5.2-backup), which we've configured as `maintenance` backend (have a look into `haproxy-conf/haproxy.cfg` file).


#!/bin/bash
echo "disable server web_backends/app1" | socat /var/run/haproxy.sock stdio
echo "disable server web_backends/app2" | socat /var/run/haproxy.sock stdio

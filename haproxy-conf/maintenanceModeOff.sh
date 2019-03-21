#!/bin/bash
echo "enable server web_backends/app1" | socat /var/run/haproxy.sock stdio
echo "enable server web_backends/app2" | socat /var/run/haproxy.sock stdio

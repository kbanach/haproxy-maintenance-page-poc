#!/bin/bash
docker ps -q --filter name="poc_proxy" | awk '{print $0" sh maintenanceModeOff.sh"}' | xargs -o docker exec

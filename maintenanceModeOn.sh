#!/bin/bash
docker ps -q --filter name="poc_proxy" | awk '{print $0" sh maintenanceModeOn.sh"}' | xargs -o docker exec

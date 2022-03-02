/usr/bin/docker run \
  --entrypoint=/bin/bash --rm -it \
  -e PUID=1000 \
  -e PGID=1000 \
  -p 8001:81 \
  --sysctl net.ipv6.conf.all.disable_ipv6=0 \
  -v /media/esata/docker/smokeping/config:/config \
  -v /media/esata/docker/smokeping/data:/data \
  ckolos/smokeping:test

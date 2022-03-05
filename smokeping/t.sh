docker run -d \
  --name=ckolos-smokeping \
  -e PUID=1000 \
  -e PGID=1000 \
  -e TZ=America/Chicago \
  -p 8889:80 \
  -v /home/ckolos/testing/smokeping/config:/config \
  -v /home/ckolos/testing/smokeping/data:/data \
  --restart unless-stopped \
ckolos/cksmoke:latest

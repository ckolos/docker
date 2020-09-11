FROM archlinux/base:latest
EXPOSE 80 81
CMD ["/usr/sbin/catatonit", "/run.sh"]
RUN pacman -Syyuv --noconfirm catatonit fcgiwrap fping grep nginx smokeping vi  \
      && pacman -Scc --noconfirm
WORKDIR /etc/smokeping
RUN find . -name '*.dist' -print -execdir sh -c 'mv {} $(basename {} .dist)' \; \
      && mv /srv/http/smokeping/smokeping.fcgi.dist /srv/http/smokeping/smokeping.fcgi \
      && ln -sf /dev/stdout /var/log/nginx/access.log \
      && ln -sf /dev/stderr /var/log/nginx/error.log \
      && mkdir /etc/nginx/conf.d
WORKDIR /
COPY smokeping.conf /etc/nginx/conf.d
COPY nginx.conf /etc/nginx/
COPY run.sh /

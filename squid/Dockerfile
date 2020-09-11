FROM archlinux/base
RUN pacman -Sy --noconfirm squid
RUN rm -f /etc/squid/squid.conf
COPY start.sh /start.sh
# USER proxy
ENTRYPOINT ["/start.sh"]
RUN yes | pacman -Scc

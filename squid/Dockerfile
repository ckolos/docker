FROM archlinux/base
RUN pacman -Sy --noconfirm squid catatonit
RUN rm -f /etc/squid/squid.conf
COPY start.sh /start.sh
# USER proxy
ENTRYPOINT ["catatonit"]
CMD ["/start.sh"]
RUN yes | pacman -Scc

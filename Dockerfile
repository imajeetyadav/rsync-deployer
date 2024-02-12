FROM ghcr.io/imajeetyadav/rsync:1.0.0

COPY entrypoint.sh /bin/entrypoint.sh

ENTRYPOINT ["/bin/entrypoint.sh"]
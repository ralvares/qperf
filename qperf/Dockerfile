FROM alpine:3.15


RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories  && \
    apk --update --no-cache  add tar bash libstdc++ bind-tools iputils busybox-extras && \
    apk --update --no-cache --force-broken-world add qperf@testing

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh


USER 1001
EXPOSE 19765
EXPOSE 19766

ENTRYPOINT [ "/entrypoint.sh" ]

FROM alpine:3.15


RUN echo "http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories  && \
    apk --update --no-cache  add tar bash libstdc++ bind-tools iputils busybox-extras curl && \
    apk --update --no-cache --force-broken-world add qperf@testing

COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

USER 1001

CMD [ "/entrypoint.sh" ]

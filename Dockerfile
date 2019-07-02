FROM alpine:3.8
RUN echo "@edge http://nl.alpinelinux.org/alpine/edge/main" >> /etc/apk/repositories \
    &&  echo "@edgecommunity http://nl.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories \
    && echo "@testing http://nl.alpinelinux.org/alpine/edge/testing" >> /etc/apk/repositories
RUN apk add --no-cache curl && rm -rf /var/run/apk/*

ENV ISTIO_VERSION=1.1.0
WORKDIR /root
RUN curl -L https://git.io/getLatestIstio | sh - && mv istio-$ISTIO_VERSION/bin/istioctl /bin && rm -rf istio-$ISTIO_VERSION
ENTRYPOINT ["istioctl"]

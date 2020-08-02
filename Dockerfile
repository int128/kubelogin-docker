FROM alpine:3.12

ARG KUBELOGIN_VERSION="v1.20.0"
ARG KUBELOGIN_SHA256="c0063f8060e969fa8c8fcfb4e37f2bbe35e7537cdbc82dd0535c96098953c6a6"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

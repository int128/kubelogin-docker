FROM alpine:3.13

ARG KUBELOGIN_VERSION="v1.22.1"
ARG KUBELOGIN_SHA256="dfbc8a6535178f58c2d96bd8d1061d4688de8c83eb1cae9d0db687224ebc6726"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

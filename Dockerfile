FROM alpine:3.11

ARG KUBELOGIN_VERSION="v1.19.3"
ARG KUBELOGIN_SHA256="4be97b6e8814f87f1c2575e517399d4d7fb5fa2b387cf42234052574ae96959e"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

FROM alpine:3.11

ARG KUBELOGIN_VERSION="v1.16.0"
ARG KUBELOGIN_SHA256="9b6cf9a886867f5b0d0f92b8a4b277698b41618352a7e7b51db0ae95e2635127"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip && \
    echo "$KUBELOGIN_SHA256  /kubelogin" | sha256sum -c -

USER daemon
ENTRYPOINT ["/kubelogin"]

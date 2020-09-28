FROM alpine:3.12

ARG KUBELOGIN_VERSION="v1.21.0"
ARG KUBELOGIN_SHA256="e0022c7f49a8626be22400910c87b778162939719068b2800649f1c10186b672"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

FROM alpine:3.11

ARG KUBELOGIN_VERSION="v1.19.1"
ARG KUBELOGIN_SHA256="3bfe06b8d1935f4276335c7c7d08945f5fcb5735b9d74701663f88908e7edef7"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

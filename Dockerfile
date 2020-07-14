FROM alpine:3.11

ARG KUBELOGIN_VERSION="v1.19.4"
ARG KUBELOGIN_SHA256="8273b6426d8f29e357000b9e7e7c70c30d40d9c343e21408a32be612b15a69eb"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

FROM alpine:3.12

ARG KUBELOGIN_VERSION="v1.20.1"
ARG KUBELOGIN_SHA256="1a61572dc76b6ec23c01ab15c7874ce6ae0e8ff470c7c1e7369ff3b2fe3dcdc0"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

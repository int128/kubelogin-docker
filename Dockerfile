FROM alpine:3.11

ARG KUBELOGIN_VERSION="v1.19.0"
ARG KUBELOGIN_SHA256="501ad0e02f6b7575233ae0cfa9b02811eb37dfde41977993e44d3589f8ca12db"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

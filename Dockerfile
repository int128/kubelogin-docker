FROM alpine:3.11

ARG KUBELOGIN_VERSION="v1.17.1"
ARG KUBELOGIN_SHA256="47b7f87ae13b304bee2a4c07e4f07803931616798a49229767e71fafeb5e6916"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

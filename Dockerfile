FROM alpine:3.11

ARG KUBELOGIN_VERSION="v1.19.2-beta.1"
ARG KUBELOGIN_SHA256="0a3699ae34ee9376da4a4958294766f9f2278a88c3ac1934eabb746c7fbbc699"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

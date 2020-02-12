FROM alpine:3.11

ARG KUBELOGIN_VERSION="v1.17.0"
ARG KUBELOGIN_SHA256="3fc82c4de760cb7969e0c1dd826a59ba1b0477f7ed08cbd66f002977f7b79868"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

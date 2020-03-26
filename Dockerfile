FROM alpine:3.11

ARG KUBELOGIN_VERSION="v1.18.0"
ARG KUBELOGIN_SHA256="9af6030e2413c8068454e71f34c559575982f02c6b17778e0875f77b1d65b3bb"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

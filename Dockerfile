FROM alpine:3.12

ARG KUBELOGIN_VERSION="v1.22.0"
ARG KUBELOGIN_SHA256="4ce6e6d2f57e2b245bbd7700bd425dd655bae488dc995524a1e70ceda27e5ff9"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

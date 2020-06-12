FROM alpine:3.11

ARG KUBELOGIN_VERSION="v1.19.2"
ARG KUBELOGIN_SHA256="c57a37a5b8c883f871e81c452b664b2120dc4aa3d2c497dd1584db1fe503f22f"

# Download the release and test the checksum
RUN wget -O /kubelogin.zip "https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip" && \
    echo "$KUBELOGIN_SHA256  /kubelogin.zip" | sha256sum -c - && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip

USER daemon
ENTRYPOINT ["/kubelogin"]

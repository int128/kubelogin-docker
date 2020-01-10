FROM alpine:3.11

ARG KUBELOGIN_VERSION=v1.15.2

RUN wget -O /kubelogin.zip https://github.com/int128/kubelogin/releases/download/$KUBELOGIN_VERSION/kubelogin_linux_amd64.zip && \
    unzip /kubelogin.zip && \
    rm /kubelogin.zip
USER daemon
EXPOSE 8000
ENTRYPOINT ["/kubelogin"]

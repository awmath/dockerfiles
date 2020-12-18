FROM quay.io/podman/stable

ENV HOME="/config"

RUN dnf update -y && dnf install -y vim git podman podman-compose && \
    sed -i 's/driver = "[a-z]*"/driver = "vfs"/' /etc/containers/storage.conf && \
    dnf install -y $(curl --silent "https://api.github.com/repos/cdr/code-server/releases/latest" |sed -n 's/.*\(https:\/\/.*code-server-[0-9\.]*-amd64.rpm\).*/\1/p'|head -n1)

COPY entrypoint.sh /

ENTRYPOINT /entrypoint.sh


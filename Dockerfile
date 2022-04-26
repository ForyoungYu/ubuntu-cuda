# Version 1.0
FROM ubuntu:21.04
LABEL maintainer="foryung_yu@outlook.com"

ARG user=salt
ARG password=188198

COPY sources.list /root
RUN useradd ${user} \
    && usermod -G sudo -d /home/${user} -s /bin/bash ${user}\
    && echo "${user}:${password}" | chpasswd \
    && echo "root:${password}" | chpasswd \
    && apt update \
    && apt install -y apt-transport-https ca-certificates \
    && mv /etc/apt/sources.list /etc/apt/sources.list.backup \
    && mv /root/sources.list /etc/apt \
    && apt update \
    && apt upgrade -y \
    && apt install -y vim ssh sudo build-essential \
    net-tools iputils-ping systemctl

USER ${user}
WORKDIR /home/${user}
EXPOSE 20
VOLUME ["/home"]
CMD /bin/bash

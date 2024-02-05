FROM ghcr.io/parkervcp/yolks:debian

RUN apt update && apt upgrade -y && apt install git

USER container
ENV  USER=container HOME=/home/container

WORKDIR /home/container
RUN mkdir /home/container/.ssh && chmod 700 /home/container/.ssh
RUN cd /home/container && git clone git@github.com:kolbasa/git-repo-watcher.git && chmod 777 git-repo-watcher/git-repo-watcher

COPY ./entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh

CMD ["/bin/bash", "/entrypoint.sh"]

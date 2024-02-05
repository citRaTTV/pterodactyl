#!/bin/bash
cd /home/container

# Replace Startup Variables
MODIFIED_STARTUP=`eval echo $(echo ${STARTUP} | sed -e 's/{{/${/g' -e 's/}}/}/g')`
echo ":/home/container$ ${MODIFIED_STARTUP}"

# Add git repo
echo ${SSH_PRIVKEY} > /home/container/.ssh/id_rsa
chmod 600 /home/container/.ssh/id_rsa
rm -Rf /home/container/resources
git clone ${GIT_URL} /home/container/resources
./git-repo-watcher/git-repo-watcher -d /home/container/resources & disown

# Run the Server
${MODIFIED_STARTUP}

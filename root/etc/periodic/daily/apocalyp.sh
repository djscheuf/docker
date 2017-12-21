#!/bin/sh

cd /app/archon

if [ "$(git tag -l apocalypse)" != "" ]; then
    GITLOG=$(git log -1 --pretty=fuller apocalypse | sed -e 's/&/\\\&amp;/g; s/</\\\&lt;/g; s/>/\\\&gt;/g; s/$/\\/g')
    cd /www.postapocalypse
    sed "s/{{ git-log }}/$GITLOG /" index.template > index.html

    nginx -s KILL
    nginx -c /etc/nginx/nginx.postapocalypse.conf &
fi
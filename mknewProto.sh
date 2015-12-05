#!/bin/bash
PWD=`pwd`
PROTO=`echo $0|sed 's/mknewProto.sh//'`
if [ $# -ne 0 ]; then
        # Print usage
        echo "wrong
        usage: change to the directory you want prototyped and call this script
        $0 
        e.g.
        ~/git/docker-prototype/mknewProto.sh
        "
            exit 1
fi
echo "$PROTO $PWD"
echo -n "Making prototype docker in current working directory Ctrl-C now to exit"
for i in {1..5};do sleep 1; echo -n '!'; done
echo '!'
cp -i $PROTO/.gitignore $PWD/
cp -i $PROTO/Makefile $PWD/
cp -i $PROTO/Dockerfile $PWD/

#! /usr/bin/zsh

## Make new MESA work directory
DIR="./work"
if [ ! -d "$DIR" ]
then
    cp -R $MESA_DIR/star/work .
    cp -R $MESA_DIR/star/defaults/*.list work
    cd work
    ./mk
else
    echo "A work directory for MESA already exists!"
    echo "Clean this directory for re-use? [y/n]"
    read response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        cd work
        ./clean
        echo "Cleaned....Done!"
    else
        echo "Skipping...Done!"
    fi
fi

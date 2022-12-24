#! /usr/bin/zsh

## Make new MESA work directory
DIR = "./work"

create_dir()
{
    if $1
    then
        echo "Enter a custom name for your MESA work directory..." 
        read inp
    else 
        inp = $(pwd)
    fi
    cp -R $MESA_DIR/star/work ./$inp
    cp -R $MESA_DIR/star/defaults/*.list $inp
    cd $inp
    ./mk
}

if [ ! -d "$DIR" ]
then
    create_dir false
else
    echo "A work directory for MESA already exists!"
    echo "Do you wish to create a new directory? [y/n]"
    read response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        create_dir true
    else
        echo "Clean the existing work directory for re-use? [y/n]"
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
fi

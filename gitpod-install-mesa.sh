#! /bin/zsh

## Install MESA
DIR="/workspace/software"

install_mesa()
{
    mkdir $DIR
    # sdk
    curl http://user.astro.wisc.edu/~townsend/resource/download/mesasdk/mesasdk-x86_64-linux-21.4.1.tar.gz --output $DIR/mesasdk-x86_64-linux-21.4.1.tar.gz
    tar xvfz $DIR/mesasdk-x86_64-linux-21.4.1.tar.gz -C $DIR/
    rm -rf $DIR/mesasdk-x86_64-linux-21.4.1.tar.gz
    #mesa
    curl https://zenodo.org/record/4311514/files/mesa-r15140.zip --output $DIR/mesa-r15140.zip
    unzip $DIR/mesa-r15140.zip -d $DIR/
    rm -rf $DIR/mesa-r15140.zip

    echo "export MESASDK_ROOT=$DIR/mesasdk" >> ~/.zshrc
    echo "source $DIR/mesasdk/bin/mesasdk_init.sh" >> ~/.zshrc
    echo "export MESA_DIR=$DIR/mesa-r15140" >> ~/.zshrc
    echo "export OMP_NUM_THREADS=2" >> ~/.zshrc

    source ~/.zshrc


    cd $DIR/mesa-r15140
    ./install

    ## Install GYRE
    export GYRE_DIR=$MESA_DIR/gyre/gyre
    cd $GYRE_DIR
    make

    echo "Done!"
}

if [ -d "$DIR/mesasdk" ] && [ -d "$DIR/mesa-r15140" ];
then
    echo "MESA already exists!!"
    echo "Set environment variables again and re-write them to .*rc/.*profile?"
    read response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        echo "export MESASDK_ROOT=$DIR/mesasdk" >> ~/.zshrc
        echo "source $DIR/mesasdk/bin/mesasdk_init.sh" >> ~/.zshrc
        echo "export MESA_DIR=$DIR/mesa-r15140" >> ~/.zshrc
        echo "export OMP_NUM_THREADS=2" >> ~/.zshrc
        source ~/.zshrc
        echo "Done!"
        echo "Please run: source ~/.zshrc"
    else  
        echo "Remove and perform a clean re-install?"
        read response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
        then
            install_mesa
        else
            echo "Skipping!"
        fi
    fi
else
    install_mesa
fi  

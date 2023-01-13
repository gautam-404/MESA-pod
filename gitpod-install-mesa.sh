#! /bin/zsh

## Install MESA
DIR="software"

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

    set_env_var

    cd $DIR/mesa-r15140
    ./install

    ## Install GYRE
    export GYRE_DIR=$MESA_DIR/gyre/gyre
    cd $GYRE_DIR
    make

    cd $DIR
    git clone --recurse-submodules https://github.com/gautam-404/PyMesaHandler.git
    cd PyMesaHandler
    pip install .
    
    echo "Done!"
}

set_env_var()
{
    echo "export MESASDK_ROOT=$DIR/mesasdk" >> ~/.zprofile
    echo "source $DIR/mesasdk/bin/mesasdk_init.sh" >> ~/.zprofile
    echo "export MESA_DIR=$DIR/mesa-r15140" >> ~/.zprofile
    echo "export OMP_NUM_THREADS=2" >> ~/.zprofile
    source ~/.zprofile
}

if [ -d "$DIR/mesasdk" ] && [ -d "$DIR/mesa-r15140" ];
then
    echo "MESA already exists!!"
    echo "Set environment variables again and re-write them to .*rc/.*profile?"
    read response
    if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
    then
        set_env_var
        echo "Done!"
        echo "Please run: source ~/.zprofile"
    else  
        echo "Remove and perform a clean re-install?"
        read response
        if [[ "$response" =~ ^([yY][eE][sS]|[yY])$ ]]
        then
            rm -rf $DIR/mesasdk && rm -rf $DIR/mesa-r15140
            install_mesa
        else
            echo "Skipping!"
        fi
    fi
else
    install_mesa
fi  

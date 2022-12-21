mkdir ~/software

curl http://user.astro.wisc.edu/~townsend/resource/download/mesasdk/mesasdk-x86_64-linux-22.6.1.tar.gz --output ~/software/mesasdk-x86_64-linux-22.6.1.tar.gz
tar xvfz ~/software/mesasdk-x86_64-linux-22.6.1.tar.gz -C ~/software/
rm -rf ~/software/mesasdk-x86_64-linux-22.6.1.tar.gz

export MESASDK_ROOT=~/software/mesasdk
echo "export MESASDK_ROOT=~/software/mesasdk" >> ~/.bash_profile
echo "source $MESASDK_ROOT/bin/mesasdk_init.sh" >> ~/.bash_profile

curl https://zenodo.org/record/4311514/files/mesa-r15140.zip?download=1 --output ~/software/mesa-r15140.zip
unzip ~/software/mesa-r15140.zip -d ~/software/
rm -rf ~/software/mesa-r15140.zip

echo "export MESA_DIR=~/software/mesa-r15140" >> ~/.bash_profile
echo "export OMP_NUM_THREADS=2" >> ~/.bash_profile
export MESA_DIR=~/software/mesa-r15140

cd $MESA_DIR
./install

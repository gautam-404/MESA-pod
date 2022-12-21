mkdir software

curl http://user.astro.wisc.edu/~townsend/resource/download/mesasdk/mesasdk-x86_64-linux-22.6.1.tar.gz --output software/mesasdk-x86_64-linux-22.6.1.tar.gz
tar xvfz software/mesasdk-x86_64-linux-22.6.1.tar.gz -C software/

echo "export MESASDK_ROOT=/workspace/MESA/software/mesasdk" >> ~/.bash_profile
echo "source $MESASDK_ROOT/bin/mesasdk_init.sh" >> ~/.bash_profile

curl https://downloads.sourceforge.net/project/mesa/releases/mesa-r15140.zip --output software/mesa-r15140.zip

echo "export MESA_DIR=/workspace/MESA/software/mesa-r15140" >> ~/.bash_profile
echo "export OMP_NUM_THREADS=2" >> ~/.bash_profile

cd $MESA_DIR
./install

mkdir software

wget -O /software/mesasdk-x86_64-linux-22.6.1.tar.gz http://user.astro.wisc.edu/~townsend/resource/download/mesasdk/mesasdk-x86_64-linux-22.6.1.tar.gz 
tar xvfz /workspace/MESA/software/mesasdk-x86_64-linux-22.6.1.tar.gz -C ~/

echo "export MESASDK_ROOT=/workspace/MESA/software/mesasdk" >> ~/.bash_profile
echo "source $MESASDK_ROOT/bin/mesasdk_init.sh" >> ~./bash_profile

wget -O /software/mesa-r15140.zip https://downloads.sourceforge.net/project/mesa/releases/mesa-r15140.zip 

echo "export MESA_DIR=/workspace/MESA/software/mesa-r15140" >> ~/.bash_profile
echo "export OMP_NUM_THREADS=2" >> ~/.bash_profile

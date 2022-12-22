mkdir /workspace/MESA/software

curl http://user.astro.wisc.edu/~townsend/resource/download/mesasdk/mesasdk-x86_64-linux-21.4.1.tar.gz --output /workspace/MESA/software/mesasdk-x86_64-linux-21.4.1.tar.gz
tar xvfz /workspace/MESA/software/mesasdk-x86_64-linux-21.4.1.tar.gz -C /workspace/MESA/software/
rm -rf /workspace/MESA/software/mesasdk-x86_64-linux-21.4.1.tar.gz

echo "export MESASDK_ROOT=/workspace/MESA/software/mesasdk" >> ~/.bash_profile
echo "source /workspace/MESA/software/mesasdk/bin/mesasdk_init.sh" >> ~/.bash_profile

curl https://zenodo.org/record/4311514/files/mesa-r15140.zip?download=1 --output /workspace/MESA/software/mesa-r15140.zip
unzip /workspace/MESA/software/mesa-r15140.zip -d /workspace/MESA/software/
rm -rf /workspace/MESA/software/mesa-r15140.zip

echo "export MESA_DIR=/workspace/MESA/software/mesa-r15140" >> ~/.bash_profile
echo "export OMP_NUM_THREADS=2" >> ~/.bash_profile

source ~/.bash_profile
echo "source ~/.bash_profile" >> ~/.bashrc

cd /workspace/MESA/software/mesa-r15140
./install

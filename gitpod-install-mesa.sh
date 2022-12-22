mkdir /workspace/software

curl http://user.astro.wisc.edu/~townsend/resource/download/mesasdk/mesasdk-x86_64-linux-21.4.1.tar.gz --output /workspace/software/mesasdk-x86_64-linux-21.4.1.tar.gz
tar xvfz /workspace/software/mesasdk-x86_64-linux-21.4.1.tar.gz -C /workspace/software/
rm -rf /workspace/software/mesasdk-x86_64-linux-21.4.1.tar.gz

echo "export MESASDK_ROOT=/workspace/software/mesasdk" >> ~/.bash_profile
echo "source /workspace/software/mesasdk/bin/mesasdk_init.sh" >> ~/.bash_profile

curl https://zenodo.org/record/4311514/files/mesa-r15140.zip?download=1 --output /workspace/software/mesa-r15140.zip
unzip /workspace/software/mesa-r15140.zip -d /workspace/software/
rm -rf /workspace/software/mesa-r15140.zip

echo "export MESA_DIR=/workspace/software/mesa-r15140" >> ~/.bash_profile
echo "export OMP_NUM_THREADS=2" >> ~/.bash_profile

source ~/.bash_profile
echo "source ~/.bash_profile" >> ~/.bashrc

cd /workspace/software/mesa-r15140
./install

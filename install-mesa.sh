sudo apt update
sudo apt -y upgrade
sudo apt install -y build-essential wget curl binutils make perl libx11-6 libx11-dev zlib1g zlib1g-dev tcsh

mkdir /workspaces/software

curl http://user.astro.wisc.edu/~townsend/resource/download/mesasdk/mesasdk-x86_64-linux-21.4.1.tar.gz --output /workspaces/software/mesasdk-x86_64-linux-21.4.1.tar.gz
tar xvfz /workspaces/software/mesasdk-x86_64-linux-21.4.1.tar.gz -C /workspaces/software/
rm -rf /workspaces/software/mesasdk-x86_64-linux-21.4.1.tar.gz

echo "export MESASDK_ROOT=/workspaces/software/mesasdk" >> ~/.bash_profile
echo "source ~/software/mesasdk/bin/mesasdk_init.sh" >> ~/.bash_profile

curl https://zenodo.org/record/4311514/files/mesa-r15140.zip?download=1 --output /workspaces/software/mesa-r15140.zip
unzip /workspaces/software/mesa-r15140.zip -d /workspaces/software/
rm -rf /workspaces/software/mesa-r15140.zip

echo "export MESA_DIR=/workspaces/software/mesa-r15140" >> ~/.bash_profile
echo "export OMP_NUM_THREADS=2" >> ~/.bash_profile

source ~/.bash_profile
echo "source ~/.bash_profile" >> ~/.bashrc

cd $MESA_DIR
./install

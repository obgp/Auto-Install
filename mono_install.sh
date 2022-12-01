apt-get install gnupg ca-certificates -y
apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys D3D831EF
echo "deb https://download.mono-project.com/repo/debian stable-xenial main" | sudo \
   tee /etc/apt/sources.list.d/mono-stable.list
apt-get update -y
apt-get install mono-complete mono-devel -y

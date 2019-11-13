# procs-docker.md
⊕ [Get Docker Engine - Community for Ubuntu | Docker Documentation](https://docs.docker.com/install/linux/docker-ce/ubuntu/)

## start
```sh
# ubuntu 18.04
$ sudo apt-get update
$ sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
$ curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
$ sudo apt-key fingerprint 0EBFCD88
$ sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
$ sudo apt-get update
$ sudo apt-get install docker-ce docker-ce-cli containerd.io
$ sudo docker run hello-world

# $ sudo usermod -aG docker your-user
$ sudo usermod -aG docker vagrant
$ docker run hello-world
```

+ 安装miniconda并设置环境变量后, 再安装

```sh
pip install docker-compose
```


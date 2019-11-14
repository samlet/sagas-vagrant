# procs-vagarant.md
## start
```sh
$ vagrant up
# You can ssh into the machine now.
$ vagrant ssh
# Halt the vagrant machine now.
$ vagrant halt

# package
# 进入Vagrant的项目目录，执行简单的命令
$ vagrant package
# ==> default: Compressing package to: /Users/huatai/Documents/Vagrant/centos-6.7/package.box

$ vagrant package --output centos-6.7.box
```

## cli
```sh
$ vagrant ssh -- -t 'cd /vagrant; /bin/bash'

# run backends
$ vagrant ssh -- -t 'cd /pi/stack/compose/dist; /home/vagrant/miniconda/bin/docker-compose up'
```

+ shortcuts

```sh
start bus
start ssh
```


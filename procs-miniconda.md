# procs-miniconda.md
⊕ [Install Miniconda in Ubuntu](https://gist.github.com/arose13/fcc1d2d5ad67503ba9842ea64f6bac35)

## start
```sh
wget https://repo.continuum.io/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh
bash ~/miniconda.sh -b -p ~/miniconda 
echo "PATH=$PATH:$HOME/miniconda/bin" >> .bashrc

# Then relogin the user, command conda will work.

$ conda create --name bigdata python=3.6

# To activate this environment, use
$ conda activate bigdata
# To deactivate an active environment, use
$ conda deactivate
```


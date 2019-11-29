# -*- mode: ruby -*-
# vi: set ft=ruby :

# All Vagrant configuration is done below. The "2" in Vagrant.configure
# configures the configuration version (we support older styles for
# backwards compatibility). Please don't change it unless you know what
# you're doing.
Vagrant.configure("2") do |config|
  # config.vm.box = "bento/ubuntu-19.10"
  config.vm.box = "bento/ubuntu-18.04"
  config.vm.hostname = "master"

  # corenlp, ltp, nltk, wordnet, bert, ...
  config.vm.synced_folder "~/tools/ai", "/pi/ai", type: "nfs"
  config.vm.synced_folder "~/nltk_data", "/home/vagrant/nltk_data", type: "nfs"

  # sagas projects
  config.vm.synced_folder "~/jcloud/assets/langs/workspace/rasa/stack", "/pi/stack", type: "nfs"
  config.vm.synced_folder "~/jcloud/assets/langs/workspace/rasa/rasa-1.x/ws", "/pi/ws", type: "nfs"

  # hanlp and stanfordnlp data
  # jcloud/assets/langs/workspace/hanlp  
  config.vm.synced_folder "~/jcloud/assets/langs/workspace/hanlp", "/pi/hanlp", type: "nfs"
  config.vm.synced_folder "~/jcloud/assets/langs/workspace/stanford-corenlp-full-2018-10-05", "/pi/stanford", type: "nfs"
  
  # network
  config.vm.network "public_network", bridge: "en0: Wi-Fi (AirPort)", auto_config: true
  config.vm.network "private_network", ip: "192.168.33.30"

  # Increase memory for Virtualbox
  config.vm.provider "virtualbox" do |vb|
      # vb.name = "docker_18"
      # vb.memory = "4096"
      vb.memory = "6144"
      vb.cpus = 2
  end
end

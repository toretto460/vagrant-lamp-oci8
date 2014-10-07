Vagrant.configure("2") do |config|

  guest_ip                 = "192.168.0.10"

  config.berkshelf.enabled = true
  config.vm.box = "ubuntu/trusty64"
  config.vm.synced_folder  ".", "/vagrant", :nfs => true
  config.vm.network        :private_network, ip: guest_ip

  config.vm.provider :virtualbox do |vb|
    vb.customize ["modifyvm", :id, "--memory", 512]
    vb.customize ["setextradata", :id, "VBoxInternal2/SharedFoldersEnableSymlinksCreate/vhosts", "1"]
  end

  
  config.vm.provision :chef_solo do |chef|
    chef.json = {
      :build_essential => {
        :compiletime => true
      },
      :oracle_instantclient => {
        :download_base   => 'https://dl.dropboxusercontent.com/u/49536335',
        :client_version  => '12_1',
        :client_dir_name => 'instantclient_12_1'
      },
      :php => {
        :ini_settings => {
          :memory_limit => -1,
          :max_execution_time => -1
        }
      }
    }

    chef.run_list = [
      "recipe[apt]",
      "recipe[build-essential]",
      "recipe[apache2]",
      "recipe[apache2::mod_php5]",
      "recipe[apache2::mod_vhost_alias]",
      "recipe[apache2::mod_rewrite]",
      "recipe[php]",
      "recipe[php::module_curl]",
      "recipe[php::module_intl]",
      "recipe[oracle-instantclient]",
      "recipe[oracle-instantclient::php]",
      "recipe[vagrant_main]"
    ]
  end
  
end
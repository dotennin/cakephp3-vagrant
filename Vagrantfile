Vagrant.configure("2") do |config|
    config.vm.provider :virtualbox do |v|
       v.name = "centos7.1"
       v.customize ["modifyvm", :id, "--memory", 1024]
    end

    config.vm.box = "centos7.1"
    config.vm.box_url = "https://github.com/CommanderK5/packer-centos-template/releases/download/0.7.1/vagrant-centos-7.1.box"

    config.vm.network :private_network, ip: "192.168.33.10" 
    config.ssh.forward_agent = true

		config.vm.provision "shell" do |sh|
			sh.path = "provisioning/provision.sh"
			sh.args = "provisioning/playbook.yml provisioning/hosts"
		end
end

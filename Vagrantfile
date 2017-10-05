Vagrant.configure("2") do |config|
    config.vm.provider :virtualbox do |v|
       v.name = "centos7.1"
       v.customize ["modifyvm", :id, "--memory", 1024]
    end

	config.vm.box = "bento/centos-7.2"
	config.vbguest.auto_update = false

    config.vm.network :private_network, ip: "192.168.33.11" 
    config.ssh.forward_agent = true

		config.vm.provision "shell" do |sh|
			sh.path = "provisioning/provision.sh"
			sh.args = "provisioning/playbook.yml provisioning/hosts"
		end
end

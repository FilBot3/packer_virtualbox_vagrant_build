# Makefile for running Packer generated Vagrant boxes.
#

.PHONY: create create-debug clean rm-cache clean-vagrant add-box

# Run the Packer command to build the OVF and Vagrant Box.
create:
	packer build centos_7_minimal_vagrant.json

create-debug:
	packer build -debug centos_7_minimal_vagrant.json

# Remove the outputs and boxes that Packer creates.
clean:
	rm -rf boxes/
	rm -rf output/

# Remove the Packer cached files to start anew.
rm-cache:
	rm -rf packer_cache/

# Remove Vagrant Boxes installed in Vagrant
clean-vagrant:
	vagrant box remove CentOS-7-Minimal

# Add the generated Vagrant Box to Vagrant.
add-box:
	vagrant box add --name=CentOS-7-Minimal boxes/centos_7_minimal_x86_64.box

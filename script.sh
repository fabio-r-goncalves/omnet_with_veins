#! /bin/bash
DIR="/home/omnetpp"

if [ "$(ls -A $DIR)" ]; then
echo "omnet dir already exists"
else 
	echo "Moving omnet"
	shopt -s dotglob
	cp -R /home/omnetpp-5.2/* /home/omnetpp
	rm -rf /home/omnetpp-5.2
	echo "installing omnet"
	cd /home/omnetpp && source setenv -f && export PATH=/home/omnetpp/bin:$PATH && ./configure && make
	echo "exporting omnet path"

fi
echo "export PATH=/home/omnetpp/bin:\$PATH" >> /root/.bashrc
chown -R 1000:1000 /home/*
top -b		

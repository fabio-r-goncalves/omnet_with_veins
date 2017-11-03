#! /bin/bash
DIR="/home/omnetpp"

if [ "$(ls -A $DIR)" ]; then
echo "omnet dir already exists"
else 
	echo "Moving omnet"
	shopt -s dotglob
	mv /home/omnetpp-5.0/* /home/omnetpp
	echo "installing omnet"
	cd /home/omnetpp && source setenv -f && export PATH=/home/omnetpp/bin:$PATH && ./configure && make
	echo "exporting omnet path"
	echo "export PATH=/home/omnetpp/bin:\$PATH" >> /root/.bashrc
fi
DIR="/home/veins"

if [ "$(ls -A $DIR)" ]; then
echo "veins dir already exists"
else 
	echo "moving veins"
	shopt -s dotglob
	mv /home/plexe-veins/* /home/veins
	echo "installing veins"
	cd /home/veins && git checkout plexe-2.0 && ./configure && make

fi
DIR="/home/sumo/sumo"

if [ "$(ls -A $DIR)" ]; then
echo "sumo dir already exists"
else 
	shopt -s dotglob
	echo "moving sumo"
	mv /home/plexe-sumo/* /home/sumo
	echo "installing sumo"
	cd /home/sumo && git checkout plexe-2.0 && cd sumo && make -f Makefile.cvs && ./configure && make
	echo "exporting sumo path"
	echo "export PATH=/home/sumo/sumo/bin:\$PATH" >> /root/.bashrc
fi




chown -R 1000:1000 /home/*
top -b		

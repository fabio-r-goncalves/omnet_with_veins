#! /bin/bash
DIR="/home/veins"

if [ "$(ls -A $DIR)" ]; then
echo "empty"
else 
echo "Moving omnet"
shopt -s dotglob
mv /home/omnetpp-5.0/* /home/omnetpp
echo "installing omnet"
cd /home/omnetpp && source setenv -f && export PATH=/home/omnetpp/bin:$PATH && ./configure && make
echo "moving veins"
shopt -s dotglob
mv /home/plexe-veins/* /home/veins
shopt -s dotglob
echo "moving sumo"
mv /home/plexe-sumo/* /home/sumo
echo "exporting paths"
echo "export PATH=/home/omnetpp/bin:$PATH" >> /root/.bashrc
echo "export PATH=/home/sumo/sumo/bin:$PATH" >> /root/.bashrc
echo "installing veins"
cd /home/veins && git checkout plexe-2.0 && ./configure && make
echo "installing sumo"
cd /home/sumo && git checkout plexe-2.0 && cd sumo && make -f Makefile.cvs && ./configure && make
chown -R 1000:1000 /home/*
fi
top -b		

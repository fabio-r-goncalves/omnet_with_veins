#! /bin/bash
DIR="/home/veins"

if [ "$(ls -A $DIR)" ]; then
echo "empty"
else 

mv /home/omnetpp-5.2 /home/omnetpp
cd /home/omnetpp && source setenv -f && export PATH=/home/omnetpp/bin:$PATH && ./configure && make
mv /home/plexe-veins/ /home/veins
mv /home/plexe-sumo/ /sumo
echo "export PATH=/home/omnetpp/bin:$PATH" >> /root/.bashrc
cd /home/veins && ./configure && make
cd /home/sumo && make -f Makefile.cvs && ./configure && make
chown -R 1000:1000 /home/*
fi
top -b

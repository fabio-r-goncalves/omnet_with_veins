#! /bin/bash
DIR="/home/omnetpp-5.2"

#if [ "$(ls -A $DIR)" ]; then
#echo "empty"
#else 
#mv /home/vsimrti-allinone/vsimrti/* /home/vsimrti
#yes "y" | bash /home/vsimrti/bin/fed/ns3/ns3_installer.sh
chown -R 1000:1000 /home/*
cd /home/omnetpp-5.2 && source setenv -f && export PATH=/home/omnetpp-5.2/bin:$PATH && ./configure && make
#fi
top -b

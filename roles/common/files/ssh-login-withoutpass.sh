#!/bin/bash
#prepare the ssh key
rm -fr ~/.ssh/id_rsa*
ssh-keygen -t rsa -f ~/.ssh/id_rsa -N "" &>/dev/null

#dispath the key to the servers

for i in {20,21,22,23,24,25,26,27,28,29,30};
do
   echo "=======hostname 192.168.1.$i==============="
   sshpass -p123456 ssh-copy-id -i ~/.ssh/id_rsa.pub "-o StrictHostKeyChecking=no" 192.168.1.$i &>/dev/null
   echo "host 192.168.1.$i is for good now"
done 

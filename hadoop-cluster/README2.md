# documentation of hadoop automation
-> mkdir /home/hadoop_cluster
-> cp /etc/ansible/ansible.cfg  /home/hadoop_cluster/ .
-> change inventory path in ansible.cfg
-> vim inventory
create ansible inventory of hosts as groups:
must pass ssh to all nodes to avoid errors from each others too (from master to all and viceversa)
[masters] [datanodes] [jobtrackers] [taskstrackers] [clients] 
-> copy jdk and hadoop rpm packages to /root/ folder.
-> copy the configuration files to /home/hadoop_cluster folder.

# run the main yml file to configure the whole hadoop cluster
-> ansible-playbook site.yml           => to configure master,datanode,jobtracker,client
-> ./download_jobtracker_mapred.sh     => to download mapred file for tasktrackers from jobtracker
-> ansible-playbook site.yml           => to configure tasktrackers
-> ./start_service.sh                  => to start service of all nodes
-> ./stop_service.sh                   => to stop service of all nodes

# ansible all -a jps     => run this to check status of all nodes if their default name apperas then                            it means confiuration is right else troubleshoot the setup
# Go to client 
-> hadoop dfsadmin -report  (will show the status of active or dead datanodes) 
also check the status in safemode

# http://masterip:50070  (to check the cluster status on browser)
# http://jobtrackerip:50030  (to check the map reduce cluster status on browser)

# TROUBLESHOOTING the CLUSTER
-> stop all services
-> hadoop namenode -format  (run on each nodes)
-> clear the caches of cluster (search in tmp folder)
-> remove the directory and create new directory
-> flush firewall (iptables -F)
-> check selinux (might be but not necessary) (getenforce command to check selinux satus if enforcing then change to permessive as setenforce 0)
-> set firewalld rule also using firewalld-cmd to all hosts


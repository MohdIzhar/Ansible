#! /bin/sh

ansible datanodes -a "hadoop-daemon.sh stop datanode"
ansible masters -a "hadoop-daemon.sh stop namenode"
ansible jobtrackers -a "hadoop-daemon.sh stop jobtracker"
ansible tasktrackers -a "hadoop-daemon.sh stop tasktracker"


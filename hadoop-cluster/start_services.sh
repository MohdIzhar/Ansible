#! /bin/sh

ansible masters -a "hadoop-daemon.sh start namenode"
ansible datanodes -a "hadoop-daemon.sh start datanode"
ansible jobtrackers -a "hadoop-daemon.sh start jobtracker"
ansible tasktrackers -a "hadoop-daemon.sh start tasktracker"


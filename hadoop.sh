# server_name   private_ip
# Airflow-ui    172.31.35.252
# n+1         	-.-.-.-	
#!/bin/bash

readlink -f $(which java)
sudo vi /opt/hadoop/hadoop-3.3.6/etc/hadoop/hadoop-env.sh

export JAVA_HOME=/usr/lib/jvm/default-java
-------------------
##### script 
----------------------------------------------------------------------------------------------------------
HADOOP_DIR="/opt/hadoop"
HADOOP_VERSION="3.3.6"
HADOOP_TARBALL="hadoop-${HADOOP_VERSION}.tar.gz"
HADOOP_URL="https://dlcdn.apache.org/hadoop/common/hadoop-${HADOOP_VERSION}/${HADOOP_TARBALL}"

# Check if Hadoop is already installed
if [ -d "$HADOOP_DIR/hadoop-${HADOOP_VERSION}" ]; then
    # Hadoop is already installed, show version
    echo "Hadoop is already installed. Version:"
    $HADOOP_DIR/hadoop-${HADOOP_VERSION}/bin/hadoop version
else
    # Hadoop is not installed, proceed with installation
    echo "Hadoop is not installed. Proceeding with installation..."
    
    # Create /opt/hadoop directory if it doesn't exist
    sudo mkdir -p $HADOOP_DIR
    
    # Download Hadoop
    sudo wget $HADOOP_URL -P $HADOOP_DIR
    
    # Extract the downloaded archive
    sudo tar xzf $HADOOP_DIR/$HADOOP_TARBALL -C $HADOOP_DIR
    
    # Set HADOOP_HOME environment variable
    echo "export HADOOP_HOME=$HADOOP_DIR/hadoop-${HADOOP_VERSION}" >> ~/.bashrc
    
    # Add Hadoop bin and sbin directories to PATH
    echo "export PATH=\$PATH:\$HADOOP_HOME/bin:\$HADOOP_HOME/sbin" >> ~/.bashrc
    
    # Source the ~/.bashrc file to apply changes
    source ~/.bashrc
    
    # Inform the user that Hadoop has been installed
    echo "Hadoop has been installed successfully."
fi

source ~/.bashrc
hadoop version
-------------------------------------------------------------------------------------------------------
sudo vi /opt/hadoop/hadoop-3.3.6/etc/hadoop/core-site.xml

<configuration>
    <property>
         <name>fs.defaultFS</name>
         <value>hdfs://172.31.35.252/</value>
    </property>
</configuration>

sudo vi /opt/hadoop/hadoop-3.3.6/etc/hadoop/hdfs-site.xml
<configuration>
   <property>
    <name>dfs.replication</name>
    <value>2</value>
   </property>
   <property>
     <name>dfs.name.dir</name>
     <value>file:///home/ubuntu/dfs/name</value>
   </property>
   <property>
     <name>dfs.data.dir</name>
     <value>file:///home/ubuntu/dfs/data</value>
   </property>
</configuration>


sudo vi /opt/hadoop/hadoop-3.3.6/etc/hadoop/mapred-site.xml
<configuration>
   <property>
      <name>mapreduce.framework.name</name>
      <value>yarn</value>
   </property>
   <property>
      <name>mapreduce.map.memory.mb</name>
      <value>2048</value>
   </property>
   <property>
      <name>mapreduce.reduce.memory.mb</name>
      <value>4096</value>
   </property>
   <property>
      <name>mapreduce.map.java.opts</name>
      <value>-Xmx1638m</value>
   </property>
   <property>
      <name>mapreduce.reduce.java.opts</name>
      <value>-Xmx3278m</value>
   </property>
   <property> 
      <name>yarn.app.mapreduce.am.env</name>
	  <value>HADOOP_MAPRED_HOME=$HADOOP_HOME</value>
    </property> 
    <property> 
       <name>mapreduce.map.env</name>
	    <value>HADOOP_MAPRED_HOME=$HADOOP_HOME</value>
    </property> 
    <property> 
        <name>mapreduce.reduce.env</name>
        <value>HADOOP_MAPRED_HOME=$HADOOP_HOME</value>
    </property> 
</configuration>

sudo vi /opt/hadoop/hadoop-3.3.6/etc/hadoop/yarn-site.xml
<configuration>
   <property>
      <name>yarn.resourcemanager.hostname</name>
      <value>172.31.35.252</value>
   </property>
   <property>
      <name>yarn.nodemanager.aux-services</name>
      <value>mapreduce_shuffle</value>
   </property>
</configuration>

sudo vi  /opt/hadoop/hadoop-3.3.6/etc/hadoop/workers

ssh-keygen -t rsa
cat ~/.ssh/id_rsa.pub >> ~/.ssh/authorized_keys
cat ~/.ssh/authorized_keys

sudo vi ~/.ssh/authorized_keys


ssh 172.31.11.221 (master-> worker)

tar cvf Hadoop_Master.tar hadoop-3.3.6
scp Hadoop_Master.tar ubuntu@172.31.11.221:/home/ubuntu/Hadoop_Master.tar

ssh 172.31.11.221
worker node
sudo tar xvf Hadoop_Master.tar
sudo apt install openjdk-8-jdk
exit

Master-Node
hdfs namenode -format



 master172-31-13-99
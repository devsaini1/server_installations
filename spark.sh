#!/bin/bash

SPARK_VERSION="3.5.1"
SPARK_HADOOP_VERSION="hadoop3"
SPARK_HOME="/opt/spark/spark-${SPARK_VERSION}"

# Check if Spark is already installed
if command -v spark-shell &>/dev/null; then
    echo "Apache Spark is already installed."
    spark-shell --version
    exit 0
fi

# Create directory for Spark installation
sudo mkdir -p /opt/spark

# Download and extract Spark
sudo wget -P /opt/spark https://dlcdn.apache.org/spark/spark-${SPARK_VERSION}/spark-${SPARK_VERSION}-bin-${SPARK_HADOOP_VERSION}.tgz
sudo tar -xzvf /opt/spark/spark-${SPARK_VERSION}-bin-${SPARK_HADOOP_VERSION}.tgz -C /opt/spark
sudo rm -f /opt/spark/spark-${SPARK_VERSION}-bin-${SPARK_HADOOP_VERSION}.tgz
sudo mv /opt/spark/spark-${SPARK_VERSION}-bin-${SPARK_HADOOP_VERSION} ${SPARK_HOME}

# Set environment variables
echo "export SPARK_HOME=${SPARK_HOME}" >> ~/.bashrc
echo "export PATH=\$PATH:\$SPARK_HOME/bin" >> ~/.bashrc

source ~/.bashrc
source ~/.bashrc

# Check Spark version
echo "Apache Spark ${SPARK_VERSION} is installed successfully."
spark-shell --version

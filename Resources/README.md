# Installation Instructions


## Setting up the Kubernetes Cluster

To set up the AKS cluster, please navigate to the Resources/ARM-Templates/AKS folder and edit the aks-cluster-parameters file to include your subscription identifier and then execute the deploy-script.sh bash file to create the cluster.

Once the cluster is up, you can use the scale-up.sh and scale-down.sh scripts to increase and decrease the cluster capacity as needed.


## Setting up Datastores using ARM Templates

The ARM templates for setting up EventHubs, Azure DB for MySQL, Azure DB for PostgreSQL and SQL Server MI are available in the Resources/ARM-Templates folder. You can use these ARM templates for your deployment


## Setting up MySQL, PostgreSQL and SQL Server on AKS Using Containers using Helm

In the Resources/HelmCharts folder, you will find the helm charts for setting up MySQL, PostgreSQL and SQL Server using docker images

You can use the following command syntax to install Helm charts


### Helm and Kubectl Syntax

```shell
# This command will install the chart or update the installation if it already exists
helm upgrade --install {release-name} {HelmChartLocation} [--set optionName=OptionValue]

# This command will uninstall all the resources associated with the Helm release installed earlier
helm uninstall {release-name}

# Check if pods is ready
kubectl -n realtime get pods

# Check if the services are ready
kubectl -n realtime get svc

# Use this to remotely log into the kafka "broker1" deployment container in the "realtime" namespace
kubectl -n realtime exec deploy/broker1 -it -- bash

# Use this command to view logs from the broker1 deployment container
kubectl -n realtime logs deploy/broker1
```

### Setting up MySQL 5.7

Run the following command to install MySQL

```shell

helm upgrade --install realtime-mysql ./MySQL57 --set infrastructure.password=OCPHack57

```

### Setting up Postgres 11.6

Run the following command to install PostgreSQL

```shell

# Install the Kubernetes Resources

helm upgrade --install realtime-postgresql ./PostgreSQL116 --set infrastructure.password=OCPHack116

```
### Setting up SQL Server 2019

Run the following command to install SQL Server 2019

```shell

helm upgrade --install realtime-sqlserver ./SQLServer2019 --set infrastructure.password=OCPHack2019

```
## Setting up Zookeeper, Kafka, Kafka Connect, Schema Registry and KSQL

These resources has to be setup in the following order

### Install Zookeeper

Run the following command to install Zookeeper and check if the services and pods are ready

```shell

# Install Zookeeper into the "realtime" namespace
helm upgrade --install realtime-zookeeper ./Confluent --set zookeeper.enabled=true

```

### Installing Kafka

 Make sure all the Zookeeper pods are ready before installing Kakfa brokers

```shell

# Install the Kafka brokers into the "realtime" namespace, then check to see if it
helm upgrade --install realtime-broker ./Confluent --set broker.enabled=true

```

### Install Schema Registry

Make sure the Kafka broker pods are all ready before you install the schema registry

```shell

helm upgrade --install realtime-registry ./Confluent --set schemaregistry.enabled=true

```


### Install Kafka Connect

Make sure the Kafka broker pods + the Schema registry are all ready before you install the Connector

```shell

helm upgrade --install realtime-connect ./Confluent --set connect.enabled=true

```

### Install Kafka REST Proxy

This allows us to see all the Kafka topics, replicas and status of the Kafka broker cluster and settings

Checkout the Kafka REST API to get more details on how to use this REST endpoint

```shell

 helm upgrade --install realtime-restproxy ./Confluent --set restproxy.enabled=true

```

### Install KSQLDB Server and KSQL CLI

Run the following commands to install KSQL DB Server and KSQL CLI

The Schema Registry, the Connect and the brokers need to be up and running before you install the KSQL DB resources

```shell

helm upgrade --install realtime-ksql ./Confluent --set ksqldbserver.enabled=true --set ksqldbcli.enabled=true

```
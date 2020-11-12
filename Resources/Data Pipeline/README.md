# Data Pipeline Workflow
This workflow is to create a simple data pipeline from Azure SQL Server Virtual Machine to Confluent KSQLDB.  Here are the steps required to build out this workflow.  This simple workflow is to help you learn how to setup the Confluent platform in Azure and consume data thru a real-time data pipeline.

## Setup Source Environment for Database
1. Create a SQL Server Virtual Machine (>=SQL 2017)
1. Open T-SQL script testdbsetup and run it in SSMS 18.x or higher

    a. Script will create a test database and setup CDC on it
    
    b. Script will create a sample table and enable CDC on table
    
    c. Script will insert recs into table for Kafka to consume
1. Open T-SQL script to create a stored procedure that will insert records into table.  Script name insertrecproc.sql
    
    a. Stored Proc will insert 10 records on each execution that will generate random numbers for NUM_SOLD
1. In Management Studio, turn on SQL Server Agent Service
1. Open and run T-SQL script agentjob that will create a job that will execute stored proc every 10 mins
1. Disable job until the last step so you have time to finish the setup in K-SQL


## Setup Postman Collection to create Debezium Connection
1. At Ubuntu command line type in 
    
    kubectl -n realtime get svc to determine IPs for restproxy and connect services

1. Go into Postman collection and update IP addresses for 
    
    a. {RestProxyIP}
    
    b. {ConnectIP}

1. Go into Create Connection Fruit and update these fields in the body
    
    a. {hostname}
    
    b. {user}
    
    c. {password}
    
    d. {server}
1. Run POST command for Create Connector Fruit to establish connection. This connector file is for debezium to connect into the SQL VM and transform the data to read it in as an AVRO file.
1. Run GET command for List Connector to confirm connector is setup
1. Run GET Connector Status to confirm "state" is "RUNNING"
1. Run GET List Topics to confirm the topic "{hostname}.dbo.fruit" is list in the topic

## Setup KSQLDB environment to CREATE Tables and SELECT data
1. Go into KSQL and run this command to login to node 

    kubectl -n realtime exec deploy/ksqldbcli -it -- bash

1. Run KSQL CLI command to open CLI 

    ksql http://ksqldbserver-internal:8088

1. Final step will be to create two tables in KSQL to view data
    
    a. Open KSQL Folder and open file ksqltables
   
    b. Copy these SQL statements into the CLI to create these tables

1. The SELECT STATEMENT will allow you to see the data in the fruit table on SQL Server.
    
    a. Run both of these scripts side by side to make sure they match

1. Enable SQL Agent job so the stored proc will be executed every 10 mins and you should see the updates in the table
    
    a. The Agg table will show you a cumultive total for each time min timeframe it ran in with it aggregating on NUM_SOLD

# Summary
This data pipeline highlight how to setup debezium connector to extract data from SQL Server using CDC and consume it as an AVRO file.  The consumption happens thru KSQLDB but requires the Connector configuration to enable it.  The connector setups the connection string and transforms the data into a Key-Value pair.  This AVRO file then can be consumed as a topic in KSQLDB.
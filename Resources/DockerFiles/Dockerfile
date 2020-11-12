# Extends the base kafka connect image from Confluent
FROM confluentinc/cp-kafka-connect-base:6.0.0

# ======================================================================================
# KAFKA CONNECT SOURCE CONNECTORS
# ======================================================================================

# Install the Azure Blob Storage Source Connector
# https://www.confluent.io/hub/confluentinc/kafka-connect-azure-blob-storage-source
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-blob-storage-source:1.3.2

# Azure Event Hubs Source Connector
# https://www.confluent.io/hub/confluentinc/kafka-connect-azure-event-hubs
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-event-hubs:1.1.0

# Azure Service Bus Source Connector
# https://www.confluent.io/hub/confluentinc/kafka-connect-azure-service-bus
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-service-bus:1.1.2

# Installs the Debezium MongoDB Source Connector
# https://docs.confluent.io/current/connect/debezium-connect-mongodb/index.html#mongodb-source-connector
RUN confluent-hub install --no-prompt debezium/debezium-connector-mongodb:1.2.2

# Installs the Debezium MySQL Source Connector
# https://docs.confluent.io/current/connect/debezium-connect-mysql/index.html#mysql-source-connector
RUN confluent-hub install --no-prompt debezium/debezium-connector-mysql:1.2.2

# Installs the Debezium SQL Server Source Connector
# https://docs.confluent.io/current/connect/debezium-connect-sqlserver/index.html#sqlserver-source-connector
RUN confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:1.2.2

# Installs the Debezium PostgreSQL Connector
# https://www.confluent.io/hub/debezium/debezium-connector-postgresql
RUN confluent-hub install --no-prompt debezium/debezium-connector-postgresql:1.2.2

# ======================================================================================
# KAFKA CONNECT SOURCE AND SINK CONNECTORS
# ======================================================================================

# Installs the MongoDB Source and Sink Connector
# https://www.confluent.io/hub/mongodb/kafka-connect-mongodb
RUN confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:1.3.0

# Installs the JDBC Source and Sink Connector
# https://docs.confluent.io/current/connect/kafka-connect-jdbc/index.html#connect-jdbc
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:10.0.0

# https://docs.confluent.io/current/connect/kafka-connect-jdbc/index.html
# Download the JAR files containing the JDBC Driver classes for each database type
# Make sure you only enable MySQL or MariaDB and not both.
# You may have conflicts if both driver classes are in the path

ARG JDBC_JAR_LOCATION="/usr/share/java/kafka-connect-jdbc"

ARG JDBC_JAR_URL_MYSQL="https://repo1.maven.org/maven2/mysql/mysql-connector-java/8.0.22/mysql-connector-java-8.0.22.jar"
ARG JDBC_JAR_URL_MARIADB="https://repo1.maven.org/maven2/org/mariadb/jdbc/mariadb-java-client/2.7.0/mariadb-java-client-2.7.0.jar"
ARG JDBC_JAR_URL_POSTGRES="https://repo1.maven.org/maven2/org/postgresql/postgresql/42.2.18/postgresql-42.2.18.jar"
ARG JDBC_JAR_URL_ORACLE="https://repo1.maven.org/maven2/com/oracle/database/jdbc/ojdbc10/19.8.0.0/ojdbc10-19.8.0.0.jar"
ARG JDBC_JAR_URL_SQLSERVER="https://repo1.maven.org/maven2/com/microsoft/sqlserver/mssql-jdbc/9.1.0.jre11-preview/mssql-jdbc-9.1.0.jre11-preview.jar"

# Create the download location for the JDBC Driver jar files
RUN mkdir -pv "${JDBC_JAR_LOCATION}"

RUN curl -k -SL "{$JDBC_JAR_URL_MYSQL}" -o "${JDBC_JAR_LOCATION}/mysql-connector-java-8.0.22.jar"
RUN curl -k -SL "{$JDBC_JAR_URL_POSTGRES}" -o "${JDBC_JAR_LOCATION}/postgresql-42.2.18.jar"
RUN curl -k -SL "{$JDBC_JAR_URL_ORACLE}" -o "${JDBC_JAR_LOCATION}/ojdbc10-19.8.0.0.jar"
RUN curl -k -SL "{$JDBC_JAR_URL_SQLSERVER}" -o "${JDBC_JAR_LOCATION}/mssql-jdbc-9.1.0.jre11-preview.jar"

# List all the jar files that have been download successfully
RUN ls -lt "${JDBC_JAR_LOCATION}"

# ======================================================================================
# KAFKA CONNECT SINK CONNECTORS
# ======================================================================================
# Add Blob Store, ADLS, Synapse Connectors, Azure Functions, Cognitive Search
# Event Hubs

# Azure Blob Storage Sink Connector
# https://www.confluent.io/hub/confluentinc/kafka-connect-azure-blob-storage
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-blob-storage:1.5.0

# Kafka Connect Azure Synapse Analytics Sink Connector
# https://www.confluent.io/hub/confluentinc/kafka-connect-azure-sql-dw
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-sql-dw:1.0.4

# Kafka Connect Azure Data Lake Gen1 Sink Connector
# https://www.confluent.io/hub/confluentinc/kafka-connect-azure-data-lake-gen1-storage
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-data-lake-gen1-storage:1.5.0

# https://www.confluent.io/hub/confluentinc/kafka-connect-azure-data-lake-gen2-storage
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-data-lake-gen2-storage:1.5.0

# Azure Functions Sink Connector
# https://www.confluent.io/hub/confluentinc/kafka-connect-azure-functions
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-functions:1.0.8

# Azure Search Sink Connector
# https://www.confluent.io/hub/confluentinc/kafka-connect-azure-search
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-search:1.0.3

# Installs the ElasticSearch Sink Connector
# https://docs.confluent.io/current/connect/kafka-connect-elasticsearch/index.html#elasticsearch-overview
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:10.0.0

# Installs the Neo4j Sink Connector
# https://www.confluent.io/hub/neo4j/kafka-connect-neo4j
RUN confluent-hub install --no-prompt neo4j/kafka-connect-neo4j:1.0.9

# Installs the Cassandra Sink Connector
# https://www.confluent.io/hub/confluentinc/kafka-connect-cassandra
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-cassandra:1.2.2

# Command to build and push the new Docker image to the remote repository
# docker build . -t izzymsft/cp-kafka-connect-base:6.0.1
# docker push izzymsft/cp-kafka-connect-base:6.0.1
# docker run --name connector -it izzymsft/cp-kafka-connect-base:6.0.1

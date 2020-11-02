# Extends the base kafka connect image from Confluent
FROM confluentinc/cp-kafka-connect-base:6.0.0

# Add Blob Store, ADLS, Synapse Connectors
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-event-hubs:1.0.3

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-blob-storage:1.5.0

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-sql-dw:1.0.4

RUN confluent-hub install --no-prompt confluentinc/kafka-connect-azure-data-lake-gen2-storage:1.5.0

# Installs the Debezium MongoDB Source Connector
# https://docs.confluent.io/current/connect/debezium-connect-mongodb/index.html#mongodb-source-connector
RUN confluent-hub install --no-prompt debezium/debezium-connector-mongodb:1.2.2

# Installs the Debezium MySQL Source Connector
# https://docs.confluent.io/current/connect/debezium-connect-mysql/index.html#mysql-source-connector
RUN confluent-hub install --no-prompt debezium/debezium-connector-mysql:1.2.2

# Installs the Debezium SQL Server Source Connector
# https://docs.confluent.io/current/connect/debezium-connect-sqlserver/index.html#sqlserver-source-connector
RUN confluent-hub install --no-prompt debezium/debezium-connector-sqlserver:1.2.2

# Installs the ElasticSearch Sink Connector
# https://docs.confluent.io/current/connect/kafka-connect-elasticsearch/index.html#elasticsearch-overview
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-elasticsearch:10.0.0

# Installs the MongoDB Source and Sink Connector
# https://www.confluent.io/hub/mongodb/kafka-connect-mongodb
RUN confluent-hub install --no-prompt mongodb/kafka-connect-mongodb:1.3.0

# Installs the Neo4j Sink Connector
# https://www.confluent.io/hub/neo4j/kafka-connect-neo4j
RUN confluent-hub install --no-prompt neo4j/kafka-connect-neo4j:1.0.9

# Installs the JDBC Source and Sink Connector
# https://docs.confluent.io/current/connect/kafka-connect-jdbc/index.html#connect-jdbc
RUN confluent-hub install --no-prompt confluentinc/kafka-connect-jdbc:5.5.2

# Sets the MySQL Driver version
ENV MYSQL_DRIVER_VERSION 5.1.39

# Downloads the JDBC driver to the docker image and decompresses the tarball into a JAR file
# This driver is needed by the JDBC kafka connector to connect to the specifc JDBC implementation (MySQL)
RUN curl -k -SL "https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-${MYSQL_DRIVER_VERSION}.tar.gz" \
     | tar -xzf - -C /usr/share/java/kafka/ --strip-components=1 mysql-connector-java-${MYSQL_DRIVER_VERSION}/mysql-connector-java-${MYSQL_DRIVER_VERSION}-bin.jar

# Command to build and push the new Docker image to the remote repository
# docker build . -t izzymsft/cp-kafka-connect-base:5.0
# docker push izzymsft/cp-kafka-connect-base:5.0

# docker run --name connector -it izzymsft/cp-kafka-connect-base:5.0

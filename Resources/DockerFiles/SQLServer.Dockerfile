# extend the SQLServer base image
FROM mcr.microsoft.com/mssql/server:2019-CU8-ubuntu-16.04

# Switching the docker user from mssql to root
USER root

# We are enabling the SQLAgents
RUN /opt/mssql/bin/mssql-conf set sqlagent.enabled true

# We are switching back to the normal user
USER mssql

# docker build . -f SQLServer.Dockerfile -t izzymsft/sqlserver2019:1
# docker push izzymsft/sqlserver2019:1

# docker run --name sqlserver -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=OcP2020123' -e 'MSSQL_PID=Express' -p 1433:1433 -d izzymsft/sqlserver2019:1
# docker exec -it sqlserver bash
# Download Azure Data Studio

# USE msdb ; GO EXEC dbo.sp_add_job @job_name = N'Daily SampleDB Backup' ; GO
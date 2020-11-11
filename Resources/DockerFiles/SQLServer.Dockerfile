# ex
FROM mcr.microsoft.com/mssql/server:2019-CU8-ubuntu-16.04

USER root

RUN /opt/mssql/bin/mssql-conf set sqlagent.enabled true

USER mssql

# docker build . -f SQLServer.Dockerfile -t izzymsft/sqlserver2019:1
# docker push izzymsft/sqlserver2019:1
# docker run --name sqlserver -e 'ACCEPT_EULA=Y' -e 'SA_PASSWORD=OcP2020123' -e 'MSSQL_PID=Express' -p 1433:1433 -d izzymsft/sqlserver2019:1
# docker exec -it sqlserver bash
# /opt/mssql-tools/bin/sqlcmd -S localhost -U sa -P OcP2020123
# USE msdb ; GO EXEC dbo.sp_add_job @job_name = N'Daily SampleDB Backup' ; GO
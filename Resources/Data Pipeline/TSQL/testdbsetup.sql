CREATE DATABASE testDB;
GO

USE testDB;
EXEC sys.sp_cdc_enable_db;

ALTER DATABASE testDB
SET CHANGE_TRACKING = ON
(CHANGE_RETENTION = 2 DAYS, AUTO_CLEANUP = ON)

CREATE TABLE fruit (
  id INTEGER IDENTITY(1001,1) NOT NULL PRIMARY KEY,
  fruit_name VARCHAR(255) NOT NULL,
  num_sold INTEGER NOT NULL
);

INSERT INTO fruit(fruit_name, num_sold)
  VALUES ('Apple', 5);
INSERT INTO fruit(fruit_name, num_sold)
  VALUES ('Pear', 10);
INSERT INTO fruit(fruit_name, num_sold)
  VALUES ('Peach', 20);

EXEC sys.sp_cdc_enable_table @source_schema = 'dbo', @source_name = 'fruit', @role_name = NULL, @supports_net_changes = 0;
GO
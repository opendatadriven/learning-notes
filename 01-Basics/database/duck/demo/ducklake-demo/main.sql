-- Ref: https://ducklake.select/docs/stable/duckdb/introduction.html

INSTALL ducklake;
INSTALL postgres;
LOAD ducklake;
LOAD postgres;

SELECT * FROM duckdb_extensions();

ATTACH 'ducklake:postgres:dbname=psyduck host=localhost user=duck password=duck' 
AS psy_ducklake 
(DATA_PATH './data');


USE psy_ducklake;
CREATE SCHEMA odd_demo;
USE psy_ducklake.odd_demo;

-- check the data
DESCRIBE TABLE 'https://blobs.duckdb.org/nl_stations.csv';
-- import the dataset into a new table
CREATE TABLE nl_train_stations AS
    FROM 'https://blobs.duckdb.org/nl_stations.csv';

-- SELECT current_catalog, current_schema;
SELECT name_long FROM nl_train_stations WHERE code = 'ASB';
FROM glob('./data/odd_demo/**');

UPDATE nl_train_stations SET name_long='Open Data Driven' WHERE code = 'ASB';
SELECT name_long FROM nl_train_stations WHERE code = 'ASB';
FROM glob('./data/odd_demo/**');

-- Check snapshots
FROM psy_ducklake.snapshots();

-- Query this table at each point:
SELECT name_long FROM nl_train_stations AT (VERSION => 2) WHERE code = 'ASB';
SELECT name_long FROM nl_train_stations AT (VERSION => 3) WHERE code = 'ASB';

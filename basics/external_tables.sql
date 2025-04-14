/*
External tables are tables that let you query data stored outside the database, without importing it.

Imp Points
---------
- You can query external data using SQL.
- The data is not stored inside the database.
- Commonly used with files (CSV, Parquet, JSON) in cloud storage like S3, Azure Blob, or HDFS.

Common use cases:
-----------------
- Data lakes (S3, ADLS) + SQL engines (Athena, Redshift Spectrum, Synapse, BigQuery)
- Processing large datasets without copying them into the warehouse
- ETL pipelines that read from raw data zones

Key benefits:
-------------
- Saves storage (no duplication)
- Ideal for big data or semi-structured data
- Great for schema-on-read (define schema at query time)
*/



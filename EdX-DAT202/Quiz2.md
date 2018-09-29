Question 1

(1 point possible)
You want to ensure that the folder on which a Hive table is based is not deleted when the table is dropped. What should you do?

 Specify the EXTERNAL keyword in the CREATE TABLE statement.  Specify the INTERNAL keyword in the CREATE TABLE statement.  Specify the LOCATION keyword in the CREATE TABLE statement.  Create the table based on an existing folder.

Question 2

(1 point possible)
The /data/source folder contains multiple files containing unstructured text data. You run the following CREATE TABLE statement:
CREATE TABLE sourcedata
(col1 INT,
 col2 STRING)
ROW FORMAT DELIMITED FIELDS TERMINATED BY ' '
STORED AS TEXTFILE LOCATION '/data/source';
Which of the following outcomes will result from the CREATE TABLE statement?
 The statement will fail because the folder already contains data files.  The statement will succeed. All existing files in /data/source will be deleted.  The statement will succeed. Rows in the existing files in /data/source that do not match the table schema will be deleted.  The statement will succeed. The table will be created on the /data/source table. No existing files will be deleted.


Question 3

(1 point possible)
You need to create a Hive table for tab-delimited data files that will be stored in the /data/calls folder. The data files contain telephone call records in the following format:
2015-08-01:10:03:00    555-123-4567    22.3
2015-08-01:11:22:00    555-098-7654    2.7
2015-08-01:11:53:00    555-111-6543    17.1
The table must be named calls, and the data files must be deleted if the table is dropped.
Which CREATE TABLE statement should you use to create the table?
 -- Option 1
CREATE TABLE calls
(calltime STRING,
 phonenumber STRING,
 duration DECIMAL);
 -- Option 2
CREATE TABLE calls
(calltime STRING,
 phonenumber STRING,
 duration DECIMAL)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t';
 -- Option 3
CREATE EXTERNAL TABLE calls
(calltime STRING,
 phonenumber STRING,
 duration DECIMAL)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE LOCATION '/data/calls';
 -- Option 4
CREATE TABLE calls
(calltime STRING,
 phonenumber STRING,
 duration DECIMAL)
ROW FORMAT DELIMITED FIELDS TERMINATED BY '\t'
STORED AS TEXTFILE LOCATION '/data/calls';

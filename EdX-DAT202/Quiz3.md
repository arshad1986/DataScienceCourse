#### Question 1

(1 point possible)
You write the following Pig Latin script. (Line numbers are included for reference only.)

<pre><code>
01 A = LOAD '/source' USING PigStorage(',') AS (c1:chararray, c2:long);
02 B = FILTER A BY c2 IS NOT NULL;
03 DUMP B;
04 C = ORDER B BY c1;
05 STORE C INTO '/output';
</code></pre>
When you run the script, on which two lines will Pig generate jobs?

* Line 01  
* Line 02  
* Line 03  
* Line 04  
* Line 05

-----------------------------------------------

#### Question 2

(1 point possible)
The file /data/values.txt contains the following text, which consists of a line containing column headings followed by multiple lines of data:

item	value
1	12.3
2	28.1
3	19.5

You run the following Pig Latin statement to load the contents of the file into a relation named data:

data = LOAD '/data/values.txt' USING PigStorage('\t') AS (item:chararray, value:float);

Which of the following represents the values in the first tuple in the data relation?

* (item, value)  
* (01, 12.3)  
* (item,)  
* (item, 12.3)
- This answer is unanswered.


-----------------------------------------------

#### Question 3

(1 point possible)
You upload a Python script named `convert.py` to the /scripts folder in the HDFS container hosted in Microsoft Azure Storage.

You write the following HiveQL code to use the Python script as a user-defined function when querying an existing table named data. (Line numbers are included for reference only.)

<pre><code>
01
02 SELECT TRANSFORM (col1, col2, col3)
03 USING 'python.exe convert.py' AS
04 (col1 string, col2 int, col3 string)
05 FROM data
06 ORDER BY col1;
</code></pre>
Which statement should you include in line 01?

* SET hive.execution.engine=tez;  
* ADD FILE wasb:///scripts/convert.py;  
* SHOW TABLES;  
* LOAD DATA INPATH '/scripts/convert.py' INTO TABLE data;

#### Question 1

(1 point possible)
You need to transfer data from a table in Microsoft Azure SQL Database to a folder in the shared storage container for your HDInsight cluster.

Which Sqoop command should you use?

 export  import  list-databases  list-tables


-----------------------------------------------------

#### Question 2

(1 point possible)
You create an Oozie workflow file that you plan to store in a folder in HDFS.

The workflow must include a Hive job that runs the HiveQL code in a file named cleanse.hql.

Which two tasks should you perform?

 Create a Hive action in the Oozie workflow file.  Create a MapReduce action in the Oozie workflow file.  Copy and paste the HiveQL code from cleanse.hql into the Oozie workflow file.  Upload cleanse.hql to the HDFS folder containing the Oozie workflow file.  Rename cleanse.hql to job.properties.

----------------------------------------

#### Question 3

(1 point possible)
You create an Oozie workflow file that includes an action that runs a HiveQL script to create a Hive table. You want to use the same workflow for multiple processes, each of which requires a Hive table with a different name.

How can you best accomplish this goal while minimizing the number of files required for the workflow?

 Create separate workflow and HiveQL script files for each process.  Create a separate workflow file for each process and add a parameter for the table name to the HiveQL script file.  Add a parameter for the table name to the workflow file and HiveQL script file, and use the same workflow and HiveQL script files for all processes.  Create a separate HiveQL script file for each process and add a parameter for the HiveQL script file name to the workflow file.

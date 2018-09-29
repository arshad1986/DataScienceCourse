####Question 1

(1 point possible)
You have provisioned a Linux-based HDInsight cluster, and need to open a remote command line interface for the head node on your Windows-based client computer in order to run a job on the cluster.

What should you do?

 Use the Windows Remote Desktop client to open a remote desktop protocol (RDP) session to the cluster name node.  Use the Azure CLI to open a secure shell (SSH) connection to the cluster name node.  Install an SSH client tool such as PuTTY, and use it to open a secure shell (SSH) connection to the cluster name node.  Install Linux because you can't connect to a Linux-based cluster from Windows.


####Question 2

(1 point possible)
You have provisioned an HDInsight Hadoop cluster with 2 worker nodes.

You need to process an unusually large batch of data, which is twice the normal size; and you want to reduce the time the processing will take.

You must minimize disruption for other processes that are currently using the cluster.

What should you do?

 Delete the cluster, and then re-create a 4-node cluster with the same name.  Dynamically increase the number of worker nodes to 4 before starting the data processing job.  Delete the cluster, and then re-create a 1-node cluster with the same name.  Dynamically decrease the number of worker nodes to 1 before starting the data processing job.


####Question 3

(1 point possible)
The default shared storage for an HDInsight cluster is hosted in a container named hd123 in a Microsoft Azure storage account named hdstore. You create a folder named data in the root of the storage container and store a file named source.txt in the folder.

Which three of the following paths can you use to reference the source.txt file?

 wasb://hdstore.hd123.blob.core.windows.net/data/source.txt  /hd123/data/source.txt  wasb://hd123@hdstore.blob.core.windows.net/data/source.txt  wasb://hdstore.blob.core.windows.net/hd123/data/source.txt  wasb:///data/source.txt  /data/source.txt
- This answer is unanswered.
There are three correct answers, and you must identify all three of them!

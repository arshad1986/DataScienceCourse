Life Cycle of a Spark Application
================================
1. The "driver program" is launched (this is your program)
2. The driver waits the launching of the Application Master task to YARN or Mesos or Spark resource manager (it is a matter of config params at spark-submit, what manager it uses)
3. Application Master allocates tasks in the cluster, according to locality, resource requirements, and nodes available ram and cpu
4. The "slave" tasks (workers) receive input splits to process
5. The slave tasks write result files
6. The job finishes and control returns to the driver program which can continue with new local processing or new cluster processing

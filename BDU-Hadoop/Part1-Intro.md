Hadoop Fundamentals
=========================================

In this video we will explain what is Hadoop and what is Big Data. We will define some Hadoop-related
open source projects and give some examples of Hadoop in action. Finally we will end off with some Big
Data solutions and the Cloud.

#### Introduction

Imagine this scenario: You have 1GB of data that you need to process. The data is stored in a relational database in your desktop computer which has no problem handling the load

Then your company starts growing very quickly, and that data grows to 10GB,
then 100GB, and you start to reach the limits of your current desktop computer.
so what do you do? you scale up by investing in a larger computer, and you are then OK for a few more
months

When your data grows from 1 TB to 10TB, and then 100TB, you are again quickly approaching the limits of that computer.
Moreover, you are now asked to feed your application with unstructured data coming from sources like
Facebook, Twitter, RFID readers, sensors, and so on.

Your management wants to derive information from both the relational data and the unstructured data
and wants this information as soon as possible What should you do? Hadoop may be the answer

#### What is Hadoop?
* Hadoop is an open source project of the Apache Foundation.
* It is a framework written in Java originally developed by Doug Cutting who named it after his son's toy
elephant.
* Hadoop uses Google’s MapReduce technology as its foundation.
* It is optimized to handle massive quantities of data which could be structured, unstructured or semistructured,
using commodity hardware, that is, relatively inexpensive computers.
* This massive parallel processing is done with great performance. However, it is a batch operation
handling massive amounts of data, so the response time is not immediate. Currently, in place updates
are not possible in Hadoop, but appends to existing data is supported.
* Now, what’s the value of a system if the information it stores or retrieves is not consistent?
Hadoop replicates its data across different computers, so that if one goes down, the data is processed
on one of the replicated computers.

#### How Hadoop Works
It is a batch operation handling massive quantities of data, so the response time is not immediate. Hadoop is not suitable for OnLine Transaction Processing workloads where data is randomly accessed on structured data like a relational database.
Also, Hadoop is not suitable for OnLine Analytical Processing or Decision Support System workloads
where data is sequentially accessed on structured data like a relational database, to generate reports that provide business intelligence.

As of Hadoop version 2.6, updates are not possible, but appends are possible. Hadoop is used for Big Data. It complements OnLine Transaction Processing and OnLine Analytical Processing. It is NOT a replacement for a relational database system.
So, what is Big Data?
With all the devices available today to collect data, such as RFID readers, microphones, cameras,
sensors, and so on, we are seeing an explosion in data being collected worldwide.
Big Data is a term used to describe large collections of data (also known as datasets) that may be
unstructured, and grow so large and quickly that it is difficult to manage with a regular database or
statistical tools.

In terms of numbers, what are we looking at? How BIG is ‘big’ data? Well there are more than 3.2 billion internet users, and
Active cell phones have surpassed 7.6 billion. There are now more in-use cell phones than there are
people on the planet (7.4 billion). Twitter processes 7TB of data ever day,
and 600TB of data is processed by Facebook every day.
Interestingly, about 80% of this data is unstructured.
With this massive amount of data, businesses need fast, reliable, deeper data insight. Therefore, Big
Data solutions based on Hadoop and other analytics software are becoming more and more relevant.

---------------------------------------------
#### Hadoop Projects
This is a list of some other open source project related to Hadoop:
- ***Eclipse*** is a popular IDE donated by IBM to the open-source community
- ***Lucene*** is a text search engine library written in Java
- ***Hbase*** is a Hadoop database
- ***Hive*** provides data warehousing tools to extract, transform and load (ETL) data, and query this data
stored in Hadoop files
- ***Pig*** is a high level language that generates MapReduce code to analyze large data sets.
- ***Spark*** is a cluster computing framework
- ***ZooKeeper*** is a centralized configuration service and naming registry for large distributed systems
- ***Ambari*** manages and monitors Hadoop clusters through an intuitive web UI
- ***Avro*** is a data serialization system
- ***UIMA*** is the architecture for the development, discovery, composition and deployment for the analysis
of unstructured data
- ***Yarn*** is a large-scale operating system for big data applications
- ***Mapreduce*** is a software framework for easily writing applications which process vast amounts of data

---------------------------------------------------------------------------
### Hadoop in action.

* ***Watson*** Early in 2011, Watson, a super computer developed by IBM competed in the popular Question and Answer show “Jeopardy!”. In that contest, Watson was successful in beating the two most winning Jeopardy players.
Approximately 200 million pages of text were input using Hadoop to distribute the workload for loading this information into memory.
Once the information was loaded, Watson used other technologies for advanced search and analysis.

* ***China Mobile*** In the telecommunication industry we have China Mobile, a company that built a Hadoop cluster to
perform data mining on Call Data Records. China Mobile was producing 5-8 TB of these records daily.
By using a Hadoop-based system they were able to process 10 times as much data as when using their
old system, and at one fifth the cost.

* *** New York Times*** In the media we have the New York Times which wanted to host on their website all public domain
articles from 1851 to 1922. They converted articles from 11 million image files (4TB) to 1.5TB of PDF
documents. This was implemented by one employee who ran a job in 24 hours on a 100-instance
Amazon EC2 Hadoop cluster at a very low cost. 

* ***IBM***
In the technology field we again have IBM with IBM ES2, and enterprise search technology based on Hadoop, Nutch, Lucene and Jaql. ES2 is designed to address unique challenges of enterprise search such as the Use of enterprise-specific vocabulary, abbreviations and acronyms

#### ES2
ES2 can perform mining tasks to build Acronym libraries, Regular expression patterns, and Geoclassification
rules.

There are also many internet or social network companies using Hadoop such as: Yahoo, Facebook,
Amazon, eBay, Twitter, StumbleUpon, Rackspace, Ning, AOL, etc. 
Yahoo of course is the largest production user with an application running a Hadoop cluster consisting of
about 10,000 Linux machines. Yahoo is also the largest contributor to the Hadoop open source project.

#### Disadavantages of Hadoop
* Hadoop is not good to process transactions due to its lack random access.
* It is not good when the work cannot be parallelized or when there are dependencies within the data,
that is, record one must be processed before record two.
* It is not good for low latency data access.
* Not good for processing lots of small files although there is work being done in this area, for example,
IBM’s Adaptive MapReduce.
* And it is not good for intensive calculations with little data.

#### Big Data solutions.
* Big Data solutions are more than just Hadoop. They can integrate analytic solutions to the mix to derive
valuable information that can combine structured legacy data with new unstructured data.
* Big data solutions may also be used to derive information from data in motion, for example, IBM has a
product called InfoSphere Streams that can be used to quickly determine customer sentiment for a new
product based on Facebook or Twitter comments.
* Finally we would like to end this presentation with one final thought: Cloud computing has gained a
tremendous track in the past few years, and it is a perfect fit for Big Data solutions. 
* Using the cloud, a
Hadoop cluster can be setup in minutes, on demand, and it can run for as long as is needed without
having to pay for more than what is used.

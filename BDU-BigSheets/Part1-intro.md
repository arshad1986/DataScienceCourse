

This course is designed to introduce the student to the capabilities of BigSheets. BigSheets is a component of InfoSphere BigInsights. It provides the analyst the ability to be able to visualize and analyze data stored HDFS using a spreadsheet type interface without any programming.

-----------------------------------------------------------
In this lesson, you will get an introduction to BigSheets and see how you can use BigSheets for analytics.

* You will be able to identify the business and technical challenges in dealing with big data. 
* You will see why and how BigSheets can help with these challenges. 
* You will see how to access BigSheets using the BigInsights console.

-----------------------------------------------------------
### Motivation
One of the Big Data challenges is "How do I get analysts to go out and analyze this data with zero
programming". If you do not have such tooling, you create an unnatural dependency on development to
code and build every piece of visualization and analysis. This is too expensive, inefficient, and time
consuming. 

BigSheets gives you exactly this, with ZERO programming. Your analysts want to be able to
visualize and analyze data in JSON, CSV, and text file formats. They want a programming-free crawler,
and more, all of which is included in BigSheets. To the person using BigSheets, it looks like a
spreadsheet, but under the covers, it generates PIG jobs to run on Hadoop.

### What is BigSheets
* BigSheets is a browser-based analytic tool designed to work with Big Data. Unlike like many other Big
Data tools, it is designed to support business users and non-technical professionals. To do so, it presents
a familiar, spreadsheet-like interface that allows users to gather, filter, combine, explore, and visualize
data from various sources.
* IBM chose the spreadsheet as the model for organizing data because most users are already familiar
with such software. If users want to represent the data in more complex ways, the tool works with an
* IBM visualization tool called Many Eyes, as well as other visualization software.
* As an important part of IBM’s Big Data strategy, BigSheets is a feature of InfoSphere BigInsights.

-----------------------------------------------------------------------------------

BigSheets is a browser-based visualization and analysis tool designed to help non-programmers work
with Big Data. It ships with BigInsights Quick Start and Enterprise Editions. 
With this tool, users model their big data in workbooks, or familiar spreadsheet-like tabular data
structures. 

Once data is represented in a workbook, business analysts can filter and enrich its content
using built-in functions and macros. Furthermore, analysts can combine data residing in different
workbooks as well as generate charts and new "sheets" (workbooks) to visualize their data. They can
even export data into a variety of common formats with a click of a button.

Here are some of the distinguishing characteristics of BigSheets:
* It presents a user interface developed specifically for business intelligence and non-technical business
users to facilitate data gathering and analysis.
* It can consume various kinds of data, such as CSV files produced by relational DBMSs and other
applications or Web crawler data produced by a built-in application provided with BigInsights.
* It can combine different sources, potentially enabling users to identify trends, opportunities, and risks
"hidden" in the data.

Before digging into the technical aspects of BigSheets, here is a walkthrough of a sample scenario that
illustrates one way in which BigSheets can be used.

Firms can import data from web sites, local file systems, and other sources into BigSheets by using a
simple graphical interface. Under the covers, BigSheets stores the data in BigInsights. Firms can then
explore and manipulate the data using the BigSheets’ simple spreadsheet interface and, if desired,
generate charts to visualize specific results.

####  BigSheets Graphical Interface
The BigSheets graphical interface enables users to create workbooks (or tabular data models) and filter
or transform the data as desired. Under the covers, BigSheets generates PIG scripts as needed and
executes the necessary work on a simulated environment consisting of sample data. This allows the user
to iteratively explore various possibilities in a very efficient manner. 

When the user is satisfied, the user can "run" the workbook, which directs BigSheets to execute MapReduce jobs over the full set of data. Looking at the flow diagram on the right, the business analysts build their model based on what they
need. The simulated results with just a sample number of rows is returned back based on the user
specified functions or formulas that have been applied to the workbook. Once the results are
satisfactory, the user will do a “Run” to have BigSheets execute the job over the full set of data.

------------------------------------------------------------------------

To begin working with BigSheets, you need to launch the BigInsights Console. You can do that by
opening up a web browser and entering in the URL. Then you click on the BigSheets item in the Tasks
pane on the left side of the Welcome page, as you can see circled on the chart in the middle. Or, if you
already have some workbooks built, just click on the BigSheets tab (circled on this chart as well) to start
working with BigSheets.

------------------------------------------------------------------------

Here are some typical steps that people take when working with the tool. Some of these steps have
been discussed.

Workbooks can be created from existing data residing in Hadoop or as a result of the output of a job
running in Hadoop.

Additional workbooks can be created by applying functions to the data in an existing workbook.
A subset of the data is used during the workbook development process. This allows the analyst to view
results in a timely manner. Later, the functions applied to a workbook can be "run" against the entire set
of data.

Not only can the result be displayed in a spreadsheet format but they can also be viewed in a chart
format as well. The final results can be exported in order to be accessed by applications outside of
BigSheets.


------------------------------------------------------------------------
#### Summary

Having completed this lesson, you should now be able to understand how BigSheets can help with the
business and technical challenges of big data. You should also be able to access BigSheets from the
BigInsights Console.

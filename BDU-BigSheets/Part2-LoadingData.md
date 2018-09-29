Loading data into BigSheets.
===================================================

After completing the lesson, you should be able to list the readers that will load the data into BigSheets.
You should be able to describe the different ways to get the data into a master workbook, and you
should also be able to explain the concept of running a workbook.


### Workbooks
For data to be accessible by BigSheets, it must be in a workbook. 
* One way to create a master workbook is from data sorted in the Hadoop file system.
From the Files tab in the BigInsights Console, select the desired file. By default, the data in that file is
displayed in a text format. Select the Sheet radio button in order to have the data placed into a Sheet
format. Then select the appropriate reader based upon the format of the data. At this point, the data
can be saved into a workbook.

* A second, but similar way to create a master workbook is to select the BigSheets tab in the BigInsights
Console and click the New Workbook pushbutton. You then choose a file that is in HDFS and an
appropriate BigSheets reader that can parse the data correctly.

* A third way is to create a master workbook directly from an application. The data, feeding into the
workbook, can either come from the application's input data or its output data.

--------------------------------------------------------------------------
In order for the data in a workbook to be parsed properly, the correct reader must be used. IBM supplies
a number of different readers and user-written plug-ins are also supported. The supplied readers are:
* Comma Separated Value - This also allows for a header record to be part of the file
* JSON (Javascript Object Notation). Both array and object reader.
* Tab Separated Value - This also allows for a header record to be part of the file
* Character Separated Value - This also allows for a header record to be part of the file. 

You must also specify the character that is used as the separator
You have your Basic Crawler - This is used to view the results from a web crawler

Data from Hive
Sheets Data
Line - This is the default reader

As stated before, BigSheets is designed to work on a subset of the data during the creation phase of a
workbook. After the workbook has been tested and is known to run properly on the subset of the data,
a run function can be executed so that the processes in the workbook are applied to the entire data set.
When viewing the list of workbooks, the status of each workbook is displayed in the form of a progress
indicator which gives a visual indication as to whether a workbook needs to be run on the entire data
set.

-------------------------------------------------------------------
### Updating Sheets
Once data is imported into a workbook, that data is static. Changing the data in the file(s) upon which
the workbook is based does not automatically change the data in the workbook. There are two methods
to update the data in a workbook.
* One way is to open the workbook and click the Refresh pushbutton. This imports the updated data into
the workbook.
* A second method is to have an application directly update a workbook. When specifying the input
parameters for an application, click on the Schedule and Advanced Settings hyperlink. Select the Update
Sheets Workbook checkbox. You can then select the workbook that the application is to update.

------------------------------------------------------------------------
Additional workbooks can be built based upon existing workbooks. When a workbook is built from an
existing workbook, a lineage is created. The original workbook becomes the parent and the newly
created workbook becomes a child. All workbooks that have the same parent workbook are sibling
workbooks.

Why have workbooks that are based on other workbooks? This allows for implementing incremental
analysis. Small manipulations of the data are made so that the effect of each of those manipulations can
be easily observed. This simplifies the analytics but also can create a documentation nightmare. 

Assume that you have created ten workbooks that, in a step by step fashion, culminate in a workbook in
which the data can be easily analyzed. Later someone looks at your final workbook and wonders how
you manipulated the data to get the results. The lineage capability of BigSheets is a self-documenting
mechanism that gives a person a way of seeing which workbooks were used in the creation of the final
workbook and the order in which they were applied.

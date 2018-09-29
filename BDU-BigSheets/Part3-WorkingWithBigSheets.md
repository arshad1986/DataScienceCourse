Working with the data in BigSheets.
==========================================

After completing the lesson, you should be able to create a workbook from a master workbook. You
should be able to list the different types of sheets that can be added to a workbook. You should be able
to add a sheet to a workbook and also to be able to modify the sheet once it has been added. You
should be able to describe the various visualization techniques that you can use to chart your data.


Now that you know how to load data into BigSheets, you need to know what you can do with them.
When you create a master workbook by importing data from the Hadoop file system, that workbook is
immutable. Columns cannot be modified and no new sheets can be added. So what you want to do
then, is to create child workbooks. 

#### Child Workbooks
Child workbooks created from an existing workbook can be edited.
Sheets can be added to the new workbook and the columns in any of the sheets can be modified. A child
workbook takes on the characteristics of its parents. This means that any sheets defined in the parent
are applied before the data is passed to a child workbook.

---------------------------------------------------------------------------------------------------

Normally, extracting data from unstructured text is a multi-step process. This is due to the complexity of
the process. The best way to approach this task is to use "baby steps". It is for this reason that BigSheets
gives you the ability to create child workbooks and each child workbook has access to twelve types of
sheets. 

Each type of sheet is used for a specific purpose but taken together, they allow you to create a
complex data extraction tool that does not require any programming on your part.
At both the top and the bottom of the BigSheets interface there is a mechanism that gives you access to
the twelve types of sheets.

You create a sheet to apply some sort of process to the data. For example, one type of sheet allows you
to filter data. A second allows you to join two sheets together. The order in which the sheets are defined
in a workbook determine the order that these processes are applied to the data.

Within a child workbook, columns can be added, removed, sorted, and hidden. In order to populate a
newly inserted column, you specify a function. You can also change the name of a workbook by clicking
on the pencil icon next to the name of the workbook.

Clicking on the triangle on a sheet’s tab allows for modification of the sheet. The sheet can be renamed,
deleted, or modified.

Selecting the Sheet Settings displays the function used to create that sheet and allows you to modify
that function. For example, if the sheet is a filter, then selecting Sheet Setting displays the filtering
criteria used to create the sheet and allows you to change that filtering criteria. If the function used to
create the sheet was a load, then you would get the option to change the reader.

For many, just looking a column (or columns) of values does not facilitate discerning patterns in the
data. Pictures tend to bring patterns into focus. Because of this, BigSheets has the ability to display data
graphically. There is also the capability to export the results of a collection into a variety of data formats.
This allows for the use of additional visualization tools not supplied by BigSheets.

-------------------------------------------------------------------------------------

#### Data Visualization 
The visualization capabilities of BigSheets include some basic chart types:
* Area - Shows a trend in data over time by connecting a series of points that represent individual
measurements.
* Pie - Shows proportionate relationships; the relative size of the "slice" reflects the proportion of the
data.
* Bar - The relative length of a rectangular bar reflects the proportion of the data. The bars are displayed
vertically.
* Line - Shows a trend in data over time by connecting a series of points that represent individual
measurements.
* Column – No longer support in 2.1.2, so you will get an error if you upgrade to 2.1.2 or import a
worksheet from a previous version into the current version. You just need to generate a different type a
chart with the same data instead.
* Horizontal Bar – Basically the same as the vertical except it is reflected horizontally.

#### Cloud Format
Then there is the ability to display the results in a cloud format.
We have a tag cloud and a bubble cloud.
* Tag Cloud - Shows the value; the relative size of a word reflects its value.
* Bubble Cloud - The relative size of the bubble reflect its value.

#### Maps
Finally, the third type employs the use of maps.
Heat Map - Charts the locations and concentrations of data points, and then shows the magnitude of
those points in relation to other points overlaid on either a map of the world or a map of the United
States.

We have a regular Map - Counts and charts data points by name, and then shows those data values
overlaid on a map

To create a chart, select the Add chart hyperlink for a workbook. Even master workbooks can have
charts. Choose the type of chart and then specify the appropriate input parameters.

### Summary
Having completed this lesson, you should be able to create a workbook from a master workbook. You
should be able to list the different types of sheets that you can add to a workbook. You should be able
to add and modify sheets in a workbook and be able to apply visualizations such as charts or graphs to
the data.

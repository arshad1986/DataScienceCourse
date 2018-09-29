1
MapReduce Programming #3
MapReduce Programming using BigInsights
1
You can write a Java MapReduce (MR) program manually, using simple text editor tools,
or you can use the Java IDE (Integrated Development Environment) capabilities of Eclipse.
Here, in this video, we will look at the process of developing your Java MR program
using the BigInsights Tools for Eclipse. The InfoSphere BigInsights Tools for Eclipse add
functionality to your Eclipse environment so that you can develop programs to run from
InfoSphere BigInsights and, of course, directly in Hadoop.
The InfoSphere BigInsights Tools for Eclipse allow you to develop, test, and run:
 Text analytics modules that contain text extractors
 Java scripts or modules
 Pig scripts
 Hive scripts
 BigSheets readers or functions, and implement those Java classes
 Java programs that use the HBase APIs
 And, of course, our interest here, Java MapReduce programs, both top down from
the highest level and bottom up from the individual components
2
After completing this topic, you will be able to:
 Create a BigInsights project
 Create a BigInsights program
 Explain how to use the MapReduce wizard to generate MapReduce skeletal code
Note here that the wizard generates skeletal code that fits into the Hadoop framework and
the MapReduce paradigm.
The code that is actually executed at runtime uses the Hadoop runtime environment and
thus uses Java classes beyond what we actually write. The Java code that we write
invokes the Java interfaces that we extend.
3
There are several ways to create an Eclipse project that uses the BigInsights perspective.
The easiest is to select Create a new BigInsights project from the BigInsights Task Launcher
in the BigInsights Tools for Eclipse.
These Eclipse Tools are part of the Eclipse IDE that has the BigInsights add-ins. Eclipse and
these add-ins are installed when you install BigInsights into your processing cluster.
2
4
This slide reminds you where to find the BigInsights perspective.
5
If the BigInsights perspective is not currently open, you click on the button —
BigInsights — in the top right hand corner of the Eclipse window.
With that perspective you create a new Project in the Project Explorer, the window that
goes down the left side of Eclipse under the BigInsights perspective.
You can right-click here to create a new project, bringing up the wizard.
Select to create a BigInsights program.
You are given several types of programs from which to choose. Select Java MapReduce
Program.
6
The wizard that steps you through the choices required to create a MapReduce program.
First you are presented with choices regarding the mapper class.
Here you type a package name,
the mapper class name and
then browse and select from the list of possible data types for the two input and two output
parameters.
7
The reducer class choices are similar, except that the two input parameter data types are
already known, since they must match the two output parameter data types from the mapper
class.
Finally specify the package name and the name for the MapReduce driver class.
8
The final result is the generation of skeletal code required by the mapper class, reducer class
and the class that drives the MapReduce application.
[Pause to provide some time to peruse the code.]
9
We have now finished this topic and you can proceed to the lab exercise. 

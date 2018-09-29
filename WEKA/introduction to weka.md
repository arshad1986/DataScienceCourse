Introduction to Weka
=======================
The Weka (pronounced Way-Kuh) workbench contains a collection of visualization tools and algorithms for 
data analysis and predictive modeling, together with graphical user interfaces for easy access to this functionality. 
The original non-Java version of Weka was a TCL/TK front-end to (mostly third-party) modeling algorithms
implemented in other programming languages, plus data preprocessing utilities in C, and a Makefile-based system
for running machine learning experiments. This original version was primarily designed as a tool for analyzing 
data from agricultural domains,but the more recent fully Java-based version (Weka 3), for which development
started in 1997, is now used in many different application areas, in particular for educational purposes and 
research.

#### Advantages of Weka include:
- free availability under the GNU General Public License
- portability, since it is fully implemented in the Java programming language and thus runs on almost any modern 
- computing platform a comprehensive collection of data preprocessing and modeling techniques
- ease of use due to its graphical user interfaces
<hr>
Weka supports several standard data mining tasks, more specifically, data preprocessing, clustering, classification, 
regression, visualization, and feature selection. All of Weka's techniques are predicated on the assumption that the 
data is available as a single flat file or relation, where each data point is described by a fixed number of attributes
(normally, numeric or nominal attributes, but some other attribute types are also supported). 
<hr>
Weka provides access to SQL databases using Java Database Connectivity and can process the result returned by a 
database query. It is not capable of multi-relational data mining, but there is separate software for converting 
a collection of linked database tables into a single table that is suitable for processing using Weka.
Another important area that is currently not covered by the algorithms included in the Weka distribution is 
sequence modeling.
<hr>
Weka's main user interface is the Explorer, but essentially the same functionality can be accessed through the 
component-based Knowledge Flow interface and from the command line. There is also the Experimenter, which allows
the systematic comparison of the predictive performance of Weka's machine learning algorithms on a collection of datasets.
<hr>
- The Explorer interface features several panels providing access to the main components of the workbench:
- The Preprocess panel has facilities for importing data from a database, a CSV file, etc., and for preprocessing this data using a so-called filtering algorithm. These filters can be used to transform the data (e.g., turning numeric attributes into discrete ones) and make it possible to delete instances and attributes according to specific criteria.
- The Classify panel enables the user to apply classification and regression algorithms (indiscriminately called classifiers in Weka) to the resulting dataset, to estimate the accuracy of the resulting predictive model, and to visualize erroneous predictions, ROC curves, etc., or the model itself (if the model is amenable to visualization like, e.g., a decision tree).
- The Associate panel provides access to association rule learners that attempt to identify all important interrelationships between attributes in the data.
- The Cluster panel gives access to the clustering techniques in Weka, e.g., the simple k-means algorithm. There is also an implementation of the expectation maximization algorithm for learning a mixture of normal distributions.
- The Select attributes panel provides algorithms for identifying the most predictive attributes in a dataset.
- The Visualize panel shows a scatter plot matrix, where individual scatter plots can be selected and enlarged, and analyzed further using various selection operators.
<hr>

Lesson 3: Pig Evaluation Functions and Other Commands
===============================================
Learning objectives

- List the eval functions used in Pig
- Describe how to invoke HDFS shell commands from a Pig script or the Grunt shell
- Explain how to execute a Pig script from the Grunt shell
- Describe the use of the Explain operator


--------------------------------------------------------------
### Evaluation functions
So far we have looked at operators that allow us to sort data, transform data, and
group data. All of that is nice but those operators, by themselves, really don’t do
much in helping us analyze our data. That is where evaluation functions come
into play.

* AVG computes the average of the number values in a single-column bag.
* CONCAT concatenates two columns
* COUNT counts the number of elements in a bag. COUNT is one of several
evaluation functions that require a preceding grouping statement. A GROUP ALL
is required for global counts and a GROUP BY is required for group counts.
* COUNT_STAR computes the number of elements in a bag
* DIFF compares two fields in a tuple
* IsEmpty checks if a bag or map is empty
* MAX computes the maximum value in a single-column bag. It has the same
requirements as COUNT as far a grouping is concerned. 
* MIN computes the minimum value in a single-column bag. It, too, has the same
grouping requirements as COUNT
* SIZE computes the number of elements based on any Pig data type
* SUM computes the sum of the numeric values in a single-column bag. It has the
same grouping requirements as COUNT.
* TOKENIZE splits a string and outputs a bag of words

----------------------------------------------------------------------
Some evaluation function examples

e have defined relation, a, has having three fields, dept,
emp, and salary. Then we have created relation, b, by grouping relation, a, on
dept. Relation, c, is comprised of relation b’s grouping value and the calculated
average of salary. Once again for any of the calculations shown in these
examples, it was necessary to first group the data.

--------------------------------------------------------------------------
#### Math functions. 

Pig has a number of available math functions. These functions are based upon the Java class Math. Some examples are ABS which returns the absolute value of a field. CEIL which takes a value and rounds up to the nearest
integer and various trigonometric functions.


#### String functions. 
These functions are based on the Java class String. Some examples are STRSPLIT which splits a string around matches of a given regular expression. SUBSTRING returns a substring from a given string. REPLACE replaces
existing characters with new characters.  ``REGEX_EXTRACT`` and ``REGEX_EXTRACT_ALL`` which perform regular expression matching and extracts the matched groups.

#### Tuple, bag, and map functions 
* TOTUPLE converts one or more expressions to a tuple. One of the shown examples takes a tuple with the values (1,2,3) and converts it to a tuple within a
tuple with the values of ((1,2)).
* TOBAG converts one or more expressions to type bag. In one of the examples a tuple with the values (1,2,3) is converted to an inner bag that contains three tuples.
* TOMAP converts pairs of expressions into a map.

### External type operators
* MAPREDUCE executes native MapReduce jobs inside a Pig script.
* STREAM sends data to an external script or program.

There are two types of UDF (user defined function) statements. 

* The DEFINE statement assigns an alias to a UDF or a streaming command. 
* The REGISTER statement registers a JAR file so that the UDFs n the file can be used. 

``fs`` invokes the Hadoop file system shell from within a Pig script or the Grunt shell.
This is nice in that you do not have to exit the Grunt shell in order to work directly with HDFS.

There are also a number of utility commands.

* The exec command, allows you to execute a Pig script from within the Grunt shell. 
* The quit command that terminates the Grunt shell is considered a utility command.

###EXPLAIN
The EXPLAIN operator is used to review the logical, physical, and MapReduce
execution plans used to create a relation. Once you have defined a relation, then
just execute EXPLAIN <relation>


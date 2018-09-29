Accessing Hadoop Data Using Hive: Hive Operators and Functions
1
Hi. Welcome to Accessing Hadoop Data Using Hive. In this lesson we will discuss Hive
Operators and Functions.
2
After completing this lesson, you should be able to:
Use a variety of Hive Operators in your queries
Utilize Hive’s Built-in Functions
And Explain ways to extend Hive functionality
3
Let’s kick things off by looking at the relational operators included in Hive. The passed
relational operands are compared and a TRUE or FALSE value is generated. If you
already know another SQL dialect, nothing here will shock you. We have an equal/not
equal operator, greater than, less than, and greater than or equal, or less than or equal
operators.
If you’d like more time to review the contents of the tables in this presentation, please
pause the video at any point.
4
Here are some additional relational operators. We can check if a value is Null or not. We
also can use LIKE and RLIKE to do comparisons on STRINGS.
5
Let’s take a look at an example of a relational operator in action. The LIKE and RLIKE
operators are very useful when searching STRING fields in your data. In this example we
search for all users that have a name that begins with the letters “Je”. You can see our
results include names like Jessica, Jeb, and Jenn.
We can use the RLIKE operator in the same manner as the LIKE operator. RLIKE allows
us to search on regular expressions which gives us even more power over our search
query.
6
Hive also contains the arithmetic operators you are used to working with, allowing for
addition, subtraction, multiplication, division, and so on.
7
The following table lists Hive’s logical operators. These operators provide support for
creating logical expressions. All of them return boolean TRUE or FALSE. We have the
AND, OR, and NOT operators available to us in Hive.
8
The operators in this table provide mechanisms to access elements in Hive’s Complex
Types. These operators and complex types are not likely to be found in the traditional
RDBMS. They are closer to what you’d find in a traditional programming language.
Array elements in Hive are accessed with the bracket notation as shown. A reminder that
array indexes are zero based.
Maps are also accessed using array bracket notation.
Structs are accessed using the dot notation.
9
Hive also has a variety of built-in functions that you can use in your queries. We list
some of the commonly used functions in this table.
10
This table has a few interesting aggregate functions and table generating functions.
Count, Sum and Average are aggregate functions you are likely to use often.
The explode function allows you to take an array or map and explode it out into zero or
more rows.
Please note that there are many more functions built into Hive – take the time to check
some of them out. You can run the command “SHOW FUNCTIONS” from within the
Hive CLI to get a listing of built-in functions.
You can then run the DESCRIBE FUNCTION command to view the documentation for
that function.
11
Hive includes windowing and analytic functions that operate as per the SQL standard.
Visit the Hive documentation for a more detailed explanation on how to work with these
types of functions.
12
Here we have a couple examples of built-in Hive functions. To use a function in Hive
you just call it by name in your query and pass any required arguments inside the
parenthesis. The first query uses the sum function and the second query uses the count
function. These both behave how we’d expect in SQL.
13
Sometimes in Hive we may want to have some functionality that goes beyond what the
built-in functions provide. One way we can do this is by creating custom user defined 
function. UDFs are implemented in Java. Once your UDF Java code is complete you
export it to a JAR file and add it to the Hive session where you can then use the function
the same way you did the built-in functions.
There are 3 different types of user defined functions you can create – regular old UDF’s,
user-defined aggregate functions, and user-defined table generating functions.
Streaming is an alternative way we can transform data using Hive. When we run a
streaming job, data is passed to an external process of our choosing. Our data is read,
processed, and the results are written back out to us. Hive has three clauses - Map,
Reduce, and Transform - that can be used for streaming.
The Streaming example here is a very basic one – we send data to the /bin/cat command
which comes on most Linux systems. The /bin/cat/ command simply echoes the data sent
to it. Hive will get the results back and print them to the CLI.
14
You have now completed this topic. Thank you for watching. 

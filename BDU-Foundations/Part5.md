Technical Details
=======================


#### Annotation Query Language (AQL)
* which is modeled after the SQL query language

#### Jaql
Jaql (JAQL) is a functional data processing and query language most commonly used for JSON query processing on BigData.

*``GROUP``
Use the GROUP expression to group one or more input arrays on a grouping key and applies an aggregate function per group.

*``JOIN``
Use the JOIN operator to express a join between two or more input arrays. This operator supports multiple types of joins, including natural, left-outer, right-outer, and outer joins.

*``SORT``
Use the SORT operator to sort an input by one or more fields.

*``TOP``
The TOP expression selects the first k elements of its input. If a comparator is provided, the output is semantically equivalent to sorting the input, then selecting the first k elements.

*``TRANSFORM``
Use the TRANSFORM operator to realize a projection or to apply a function to all items of an output.

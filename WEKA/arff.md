An ARFF (Attribute-Relation File Format) file is an ASCII text file that describes a list of instances sharing a set of attributes. ARFF files were developed by the Machine Learning Project at the Department of Computer Science of The University of Waikato for use with the Weka machine learning software. 

#### Structure of an ARFF File
ARFF files have two distinct sections. The first section is the Header information, which is followed the Data information.

The Header of the ARFF file contains the name of the relation, a list of the attributes (the columns in the data), and their types. An example header on the standard IRIS dataset looks like this:
```
   % 1. Title: Iris Plants Database
   % 
   % 2. Sources:
   %      (a) Creator: R.A. Fisher
   %      (b) Donor: Michael Marshall (MARSHALL%PLU@io.arc.nasa.gov)
   %      (c) Date: July, 1988
   % 
   @RELATION iris

   @ATTRIBUTE sepallength  NUMERIC
   @ATTRIBUTE sepalwidth   NUMERIC
   @ATTRIBUTE petallength  NUMERIC
   @ATTRIBUTE petalwidth   NUMERIC
   @ATTRIBUTE class        {Iris-setosa,Iris-versicolor,Iris-virginica}
```  
The Data of the ARFF file looks like the following:
```
   @DATA
   5.1,3.5,1.4,0.2,Iris-setosa
   4.9,3.0,1.4,0.2,Iris-setosa
   4.7,3.2,1.3,0.2,Iris-setosa
   4.6,3.1,1.5,0.2,Iris-setosa
   5.0,3.6,1.4,0.2,Iris-setosa
   5.4,3.9,1.7,0.4,Iris-setosa
   4.6,3.4,1.4,0.3,Iris-setosa
   5.0,3.4,1.5,0.2,Iris-setosa
   4.4,2.9,1.4,0.2,Iris-setosa
   4.9,3.1,1.5,0.1,Iris-setosa
```   

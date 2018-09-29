The Rcpp package provides C++ classes that greatly facilitate interfacing C or C++ code in R packages.

Rcpp provides matching C++ classes for a large number of basic R data types. Hence, a package author can keep his data in normal R data structures without having to worry about translation or transfering to C++. At the same time, the data structures can be accessed as easily at the C++ level, and used in the normal manner.

The mapping of data types works in both directions. It is as straightforward to pass data from R to C++, as it is it return data from C++ to R.
<ul>
	<li>Rcpp: Seamless R and C++ Integration - <a href="http://dirk.eddelbuettel.com/code/rcpp/Rcpp-introduction.pdf" target="_blank">Here</a>    ( <em>Dirk EddelBuettal</em> )</li>
	<li>High performance functions with Rcpp - <a href="http://adv-r.had.co.nz/Rcpp.html" target="_blank">Here</a>   ( <em>Hadley Wickham</em> )</li>
	<li>Rcpp Quick Reference Guide - <a href="http://cran.rstudio.com/web/packages/Rcpp/vignettes/Rcpp-quickref.pdf" target="_blank">Here  </a>                  (<em> Romain Francois</em>)</li>
</ul>

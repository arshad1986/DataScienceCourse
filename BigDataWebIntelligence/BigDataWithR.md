<div>
<ul>
	<li><span style="line-height:1.714285714;font-size:1rem;"><em><strong>RHadoop</strong> </em>Package – </span><a style="line-height:1.714285714;font-size:1rem;" title="RHADOOP" href="https://github.com/RevolutionAnalytics/RHadoop/wiki/rmr" target="_blank">Here</a><span style="line-height:1.714285714;font-size:1rem;">   | Tutorial by Ryan Hafen- <a href="http://ml.stat.purdue.edu/rhafen/rhipe/">Here</a></span></li>
	<li><span style="line-height:1.714285714;font-size:1rem;">MapReduce (</span><a style="line-height:1.714285714;font-size:1rem;" title="MapReduce" href="http://en.wikipedia.org/wiki/MapReduce" target="_blank">WIKI</a><span style="line-height:1.714285714;font-size:1rem;">) / </span><a style="line-height:1.714285714;font-size:1rem;" title="rmr" href="https://github.com/RevolutionAnalytics/RHadoop/wiki/rmr" target="_blank">rmr</a> package</li>
	<li><em><strong>Rhipe</strong> </em>– Divide and Recombine with RHIPE – <a title="Divide and Recombine (D&R) with RHIPE " href="http://www.datadr.org/" target="_blank">here</a></li>
	<li>Five ways to handle Big Data in R - <a href="http://www.r-bloggers.com/five-ways-to-handle-big-data-in-r/" target="_blank">RBloggers</a></li>
	<li>Implementing <strong><em>mclapply()</em> </strong>on Windows: a primer on embarrassingly parallel computation on multicore systems with R - <a href="http://www.stat.cmu.edu/~nmv/2014/07/14/implementing-mclapply-on-windows/" target="_blank">Here</a></li>
</ul>
<strong>Programming with Big Data in <a href="http://www.r-project.org/">R</a></strong>
(from : <a href="http://r-pbd.org/">http://r-pbd.org/</a>)

The “Programming with Big Data in <a href="http://www.r-project.org/">R</a>” project (pbdR) enables high-level distributed data parallelism in R, so that it can easily utilize large HPC platforms with thousands of cores, making the R language scale to unparalleled heights.

We achieve this, in part, by providing a simple interface to scalable, high performance libraries, such as <a href="https://en.wikipedia.org/wiki/Message_Passing_Interface">MPI</a>,<a href="https://en.wikipedia.org/wiki/ScaLAPACK">ScaLAPACK</a>, and <a href="https://en.wikipedia.org/wiki/NetCDF">NetCDF4</a>. The routines in these libraries are engaged through R’s classes and methods, so that the R language syntax is largely preserved, but with new, scalable, compiled code underneath. Most of the cumbersome distributed details are abstracted away for the user, although they are readily accessible should the user desire them.

We provide <a href="http://rbigdata.github.io/packages.html">several R packages</a> which focus on analyzing big data, especially on large distributed machines. The packages are meant to be used in the <a href="https://en.wikipedia.org/wiki/SPMD">Single Program/Multiple Data (SPMD)</a> programming model (<a href="http://thirteen-01.stat.iastate.edu/snoweye/hpsc/?item=spmd">see also</a>), with special focus on large scale computing clusters. Packages and instructions for installation are available on the <a href="http://rbigdata.github.io/download.html">downloads page</a>.

<strong>RHIPE</strong>
<p align="left">RHIPE (hree-pay’) is the <em><strong>R and Hadoop Integrated Programming Environment</strong></em>. It means “in a moment” in Greek. RHIPE is a merger of R and Hadoop. R is the widely used, highly acclaimed interactive language and environment for data analysis. Hadoop consists of the Hadoop Distributed File System (HDFS) and the MapReduce distributed compute engine. RHIPE allows an analyst to carry out D&R analysis of complex big data wholly from within R. RHIPE communicates with Hadoop to carry out the big, parallel computations.</p>

</div>

 Step 4: use the classifier
 =================================
For real world applications, the actual use of the classifier is the ultimate goal. 
Here’s the simplest way to achieve that. 
Let’s say we’ve built an instance (named iUse) as explained in step 2:

<pre><code>
 // Specify that the instance belong to the training set 

 // in order to inherit from the set description
 iUse.setDataset(isTrainingSet);
 
 // Get the likelihood of each classes 
 // fDistribution[0] is the probability of being “positive” 
 // fDistribution[1] is the probability of being “negative” 
 double[] fDistribution = cModel.distributionForInstance(iUse);
</code></pre>

### Conclusion and More Information
This tutorial shows the basic way to train, test and use a classifier programmatically in Weka. 
The code shown was not compiled nor tested since it requires being part of a real classification problem. 

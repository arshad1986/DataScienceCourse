Step 3: Test the classifier
==============================
Now that we create and trained a classifier, let’s test it. 
To do so, we need an evaluation module (weka.classifiers.Evaluation) to which we feed a testing set (see section 2, since the testing set is built like the training set).
<pre><code>
 // Test the model
 Evaluation eTest = new Evaluation(isTrainingSet);
 eTest.evaluateModel(cModel, isTestingSet);
</code></pre>
The evaluation module can output a bunch of statistics:
<pre><code>
 // Print the result à la Weka explorer:
 String strSummary = eTest.toSummaryString();
 System.out.println(strSummary);
 
 // Get the confusion matrix
 double[][] cmMatrix = eTest.confusionMatrix();
 </code></pre>

Step 2: Train a Classifier
==============================
Training requires 1) having a training set of instances and 2) choosing a classifier.

- Let’s first create an empty training set (weka.core.Instances). 
- We named the relation “Rel”. 
- The attribute prototype is declared using the vector from step 1.
- We give an initial set capacity of 10. 
- We also declare that the class attribute is the fourth one in the vector (see step 1)
<pre><code>
 // Create an empty training set
 Instances isTrainingSet = new Instances("Rel", fvWekaAttributes, 10);           
 // Set class index
 isTrainingSet.setClassIndex(3);
</code></pre>
Now, let’s fill the training set with one instance (`weka.core.Instance``):
<pre><code>
 // Create the instance
 Instance iExample = new Instance(4);
 iExample.setValue((Attribute)fvWekaAttributes.elementAt(0), 1.0);      
 iExample.setValue((Attribute)fvWekaAttributes.elementAt(1), 0.5);      
 iExample.setValue((Attribute)fvWekaAttributes.elementAt(2), "gray");
 iExample.setValue((Attribute)fvWekaAttributes.elementAt(3), "positive");
 
 // add the instance
 isTrainingSet.add(iExample);
</code></pre>
Finally, Choose a classifier (weka.classifiers.Classifier) and create the model. Let’s, for example, create a naive Bayes classifier (weka.classifiers.bayes.NaiveBayes)
<pre><code>
// Create a naïve bayes classifier 
 Classifier cModel = (Classifier)new NaiveBayes();
 cModel.buildClassifier(isTrainingSet);
 </code></pre>

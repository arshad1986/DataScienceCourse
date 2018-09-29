Modeling the Data
===========================
Discriminant function analysis is based on modeling the interval variable for each group with a normal curve. The mean of each group is used an estimate of mu for that group. Sigma for each group can be estimated by using weighted mean of the within group variances or using the standard deviation of that group. 

In the case of the weighted mean the variances are weighted by sample size and can be calculated either as the denominator for a nested t-test or as the square root of the Mean Squares Within Groups in an ANOVA, providing identical estimates. When using the weighted mean of the variances, one must assume that the generating function for each group produces numbers that in the long run have the same variability.

In the simple case of dichotomous groups and a single predictor variable, it really does not make a great deal of difference in the complexity of the model if the variability of each groups is assumed to be equal or not. This is not true, however, when more groups and more predictor variables are added to the model. For that reason, the assumption of equality of within group variance is almost universal in discriminant function analysis.

The following program allows the student to explore the relationship between different generating functions (poor, medium, or good discrimination; equal or unequal variances), sample size, and resulting model based on the sample. The student should verify that larger sample sizes provide resulting models that are more similar to the generating model. The student should also explore the effect of violations of the equality of variance assumptions on the resulting model.

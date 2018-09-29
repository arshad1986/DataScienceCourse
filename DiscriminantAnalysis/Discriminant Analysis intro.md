
% MANOVA
% https://statistics.laerd.com/spss-tutorials/one-way-manova-using-spss-statistics.php
% http://lib.stat.cmu.edu/cgi-bin/dasl.cgi?query=MANOVA&submit=Search%21&metaname=methods&sort=swishrank
%
% http://userwww.sfsu.edu/efc/classes/biol710/discrim/discrim.pdf
% http://www.statsoft.com/textbook/discriminant-function-analysis/
% http://www.psychstat.missouristate.edu/multibook/mlt03.htm
%
%



DISCRIMINANT FUNCTION ANALYSIS

Overview

Discriminant function analysis, also known as discriminant analysis or simply DA, is used to classify cases into the values of a categorical dependent, usually a dichotomy. If discriminant function analysis is effective for a set of data, the classification table of correct and incorrect estimates will yield a high percentage correct. Discriminant function analysis is found in SPSS under Analyze>Classify>Discriminant. If the specified grouping variable has two categories, the procedure is considered "discriminant analysis" (DA). If there are more than two categories the procedure is considered "multiple discriminant analysis" (MDA).

Multiple discriminant analysis (MDA) is a cousin of multiple analysis of variance (MANOVA), sharing many of the same assumptions and tests. MDA is sometimes also called discriminant factor analysis or canonical discriminant analysis.

While binary and multinomial logistic regression, treated in a separate Statistical Associates "Blue Book" volume, is often used in place of DA or MDA respectively, if the assumptions of discriminant analysis are met, it has greater power than logistic regression: there is less chance of Type II errors - accepting a false null hypothesis. If the data violate assumptions of discriminant analysis, outlined below, then logistic regression may be preferred because it usually involves fewer violations of assumptions (independent variables needn't be normally distributed, linearly related, or have equal within-group variances), is robust, handles categorical as well as continuous variables, and has coefficients which many find easier to interpret. Logistic regression is preferred when data are not normal in distribution or group sizes are very unequal.

There are several purposes for DA and/or MDA:

- To classify cases into groups using a discriminant prediction equation.
- To test theory by observing whether cases are classified as predicted.
- To investigate differences between or among groups.
- To determine the most parsimonious way to distinguish among groups.
- To determine the percent of variance in the dependent variable explained by the independents.
- To determine the percent of variance in the dependent variable explained by the independents over and above the variance accounted for by control variables, using sequential discriminant analysis.
- To assess the relative importance of the independent variables in classifying the dependent variable.
- To discard variables which are little related to group distinctions.
- To infer the meaning of MDA dimensions which distinguish groups, based on discriminant loadings.

#### Steps in Discrimiant Analysis
Discriminant analysis has basic two steps: 
- (1) an F test (Wilks' lambda) is used to test if the discriminant model as a whole is significant,  
- (2) if the F test shows significance, then the individual independent variables are assessed to see which differ significantly in mean by group and these are used to classify the dependent variable.

#### Assumptions
Discriminant analysis shares all the usual assumptions of correlation, requiring linear and homoscedastic relationships and untruncated interval or near interval data. Like multiple regression and most statistical procedures, DA also assumes proper model specification (inclusion of all important independents and exclusion of causally extraneous but correlated variables). DA also assumes the dependent variable is a true dichotomy since data which are forced into dichotomous coding are truncated, attenuating correlation.



<hr>
Logistic regression answers the same questions as discriminant analysis. It is
often preferred to discriminate analysis as it is more flexible in its assumptions
and types of data that can be analyzed. Logistic regression can handle both
categorical and continuous variables, and the predictors do not have to be
normally distributed, linearly related, or of equal variance within each group.

The performance of a discriminant function can be evaluated by estimating error rates
(probabilities of misclassification).

Do not confuse discriminant analysis with cluster analysis. All varieties of discriminant
analysis require prior knowledge of the classes, usually in the form of a sample
from each class. In cluster analysis, the data do not include information on class
membership; the purpose is to construct a classification.

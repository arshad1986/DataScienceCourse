# Perceptron - Import datasets
# Imports datasets into R using the matlab package

library(R.matlab)

dataset1 <- readMat("Datasets/dataset1.mat")
dataset2 <- readMat("Datasets/dataset2.mat")
dataset3 <- readMat("Datasets/dataset3.mat")
dataset4 <- readMat("Datasets/dataset4.mat")

############################################
# Learns the weights of a perceptron and displays the results.
source("Perceptron Learning Algorithm/PlotPerceptron.R")

learn_perceptron <- function(neg_examples_nobias,pos_examples_nobias,w_init,w_gen_feas) {
#      %% 
#      % Learns the weights of a perceptron for a 2-dimensional dataset and plots
#      % the perceptron at each iteration where an iteration is defined as one
#      % full pass through the data. If a generously feasible weight vector
#      % is provided then the visualization will also show the distance
#      % of the learned weight vectors to the generously feasible weight vector.
#      % Required Inputs:
#      %   neg_examples_nobias - The num_neg_examples x 2 matrix for the examples with target 0.
#      %       num_neg_examples is the number of examples for the negative class.
#      %   pos_examples_nobias - The num_pos_examples x 2 matrix for the examples with target 1.
#      %       num_pos_examples is the number of examples for the positive class.
#      %   w_init - A 3-dimensional initial weight vector. The last element is the bias.
#      %   w_gen_feas - A generously feasible weight vector.
#      % Returns:
#      %   w - The learned weight vector.
#      %%
     
     # Bookkeeping
     num_neg_examples = nrow(neg_examples_nobias)  # assumes 2-dimensions
     num_pos_examples = nrow(pos_examples_nobias)  # assumes 2 dimensions
     num_err_history = NULL
     w_dist_history = NULL

     # Here we add a column of ones to the examples in order to allow us to learn bias parameters
     neg_examples <- cbind(neg_examples_nobias, 1)
     pos_examples <- cbind(pos_examples_nobias, 1)
     
     # If weight vectors have not been provided, initialize them appropriately.
     if(missing(w_init) | length(w_init) == 0) {
          w <- rnorm(3)
     } else w <- w_init
     
     if(missing(w_gen_feas)) w_gen_feas <- NULL
     
     # Find the data points that the perceptron has incorrectly classified and record the number of errors it makes.
     iter <- 0
     res <- eval_perceptron(neg_examples, pos_examples, w)
     mistakes0 <- res$mistakes0
     mistakes1 <- res$mistakes1
     num_errs <- length(mistakes0) + length(mistakes1)
     num_err_history <- c(num_err_history, num_errs)
     
     printf("Number of errors in iteration %d:\t%d\n", iter, num_errs)
     printf("weights:\t%f\n", w)
     # or use err_message <- sprintf(); message(err_message)
     
     # If a generously feasible weight vector exists, record the distance to it from the initial weight vector.
     if(length(w_gen_feas) != 0) w_dist_history <- c(w_dist_history, norm(w - w_gen_feas, type="2"))
     
     plot_perceptron(neg_examples, pos_examples, mistakes0, mistakes1, num_err_history, w, w_dist_history)
     key <- readline("<Press 'enter' to continue, 'q' to quit.>")
     if(key == 'q') return(w)
     

     
     # Iterate until the perceptron has correctly classified all points.
     while (num_errs > 0) {
          iter <- iter + 1
          
          # Update the weights of the perceptron.
          w <- update_weights(neg_examples, pos_examples, w)
          
          # If a generously feasible weight vector exists, record the distance to it from the initial weight vector.
          if(length(w_gen_feas) != 0) w_dist_history <- c(w_dist_history, norm(w - w_gen_feas, type="2"))
          
          # Find the data points that the perceptron has incorrectly classified and record the number of errors it makes.
          res <- eval_perceptron(neg_examples, pos_examples, w)
          mistakes0 <- res$mistakes0
          mistakes1 <- res$mistakes1
          num_errs <- length(mistakes0) + length(mistakes1)
          num_err_history <- c(num_err_history, num_errs)
          
          printf("Number of errors in iteration %d:\t%d\n", iter, num_errs)
          printf("weights:\t%f\n", w)
          # or use err_message <- sprintf(); message(err_message)
          
          plot_perceptron(neg_examples, pos_examples, mistakes0, mistakes1, num_err_history, w, w_dist_history)
          key <- readline("<Press 'enter' to continue, 'q' to quit.>")
          if(key == 'q') return(w)    
     }
     return(list(w=w, w_dist_history=w_dist_history))
}

######################################################################################
eval_perceptron <- function(neg_examples, pos_examples, w) {
#      %% 
#      % Evaluates the perceptron using a given weight vector. Here, evaluation
#      % refers to finding the data points that the perceptron incorrectly classifies.
#      % Inputs:
#      %   neg_examples - The num_neg_examples x 3 matrix for the examples with target 0.
#      %       num_neg_examples is the number of examples for the negative class.
#      %   pos_examples- The num_pos_examples x 3 matrix for the examples with target 1.
#      %       num_pos_examples is the number of examples for the positive class.
#      %   w - A 3-dimensional weight vector, the last element is the bias.
#      % Returns:
#      %   mistakes0 - A vector containing the indices of the negative examples that have been
#      %       incorrectly classified as positive.
#      %   mistakes0 - A vector containing the indices of the positive examples that have been
#      %       incorrectly classified as negative.
#      %%
     
     num_neg_examples = nrow(neg_examples)  # assumes 2-dimensions
     num_pos_examples = nrow(pos_examples)  # assumes 2 dimensions
     
     mistakes0 <- NULL
     mistakes1 <- NULL
     
     for(i in 1:num_neg_examples) {
          x <- neg_examples[i,]
          activation <- x %*% w
          if(activation >= 0) mistakes0 <- c(mistakes0, i)  
     }
     
     for(i in 1:num_pos_examples) {
          x <- pos_examples[i,]
          activation <- x %*% w
          if(activation < 0) mistakes1 <- c(mistakes1, i) 
     }
     
     return(list(mistakes0=mistakes0, mistakes1=mistakes1))
}

# %WRITE THE CODE TO COMPLETE THIS FUNCTION
update_weights <- function(neg_examples, pos_examples, w_current) {
# %% 
#      % Updates the weights of the perceptron for incorrectly classified points
# % using the perceptron update algorithm. This function makes one sweep
# % over the dataset.
# % Inputs:
#      %   neg_examples - The num_neg_examples x 3 matrix for the examples with target 0.
# %       num_neg_examples is the number of examples for the negative class.
# %   pos_examples- The num_pos_examples x 3 matrix for the examples with target 1.
# %       num_pos_examples is the number of examples for the positive class.
# %   w_current - A 3-dimensional weight vector, the last element is the bias.
# % Returns:
#      %   w - The weight vector after one pass through the dataset using the perceptron
# %       learning rule.
# %%
     w <- w_current
     
     num_neg_examples = nrow(neg_examples)  # assumes 2-dimensions
     num_pos_examples = nrow(pos_examples)  # assumes 2 dimensions
     
     for(i in 1:num_neg_examples) {
          this_case <- neg_examples[i,]
          activation <- this_case %*% w
          if(activation >= 0) {
               # YOUR CODE HERE
               # output unit incorrectly outputted a 1; subtract input vector from the weight vector
               w <- w - this_case
          }
     }
     
     for(i in 1:num_pos_examples) {
          this_case <- pos_examples[i,]
          activation <- this_case %*% w
          if(activation < 0) {
               # YOUR CODE HERE
               # output unit incorrectly outputted a 0; add input vector to the weight vector
               w <- w + this_case  
          }
     }
     
     return(w)
            
}
##################################################################################
# %% Plots information about a perceptron classifier on a 2-dimensional dataset.
plot_perceptron <- function(neg_examples, pos_examples, mistakes0, mistakes1, num_err_history, w, w_dist_history) {
# %%
# % The top-left plot shows the dataset and the classification boundary given by
# % the weights of the perceptron. The negative examples are shown as circles
# % while the positive examples are shown as squares. If an example is colored
# % green then it means that the example has been correctly classified by the
# % provided weights. If it is colored red then it has been incorrectly classified.
# % The top-right plot shows the number of mistakes the perceptron algorithm has
# % made in each iteration so far.
# % The bottom-left plot shows the distance to some generously feasible weight
# % vector if one has been provided (note, there can be an infinite number of these).
# % Points that the classifier has made a mistake on are shown in red,
# % while points that are correctly classified are shown in green.
# % The goal is for all of the points to be green (if it is possible to do so).
# % Inputs:
# %   neg_examples - The num_neg_examples x 3 matrix for the examples with target 0.
# %       num_neg_examples is the number of examples for the negative class.
# %   pos_examples- The num_pos_examples x 3 matrix for the examples with target 1.
# %       num_pos_examples is the number of examples for the positive class.
# %   mistakes0 - A vector containing the indices of the datapoints from class 0 incorrectly
# %       classified by the perceptron. This is a subset of neg_examples.
# %   mistakes1 - A vector containing the indices of the datapoints from class 1 incorrectly
# %       classified by the perceptron. This is a subset of pos_examples.
# %   num_err_history - A vector containing the number of mistakes for each
# %       iteration of learning so far.
# %   w - A 3-dimensional vector corresponding to the current weights of the
# %       perceptron. The last element is the bias.
# %   w_dist_history - A vector containing the L2-distance to a generously
# %       feasible weight vector for each iteration of learning so far.
# %       Empty if one has not been provided.
# %%
     # set up the plot
     par(mfrow=c(2,2))
     
     # Plot 1: classification boundary
     x_lim <- c(-1, 1)
     y_lim <- c(-1, 1)
     plot(NULL, NULL, xlim=x_lim, ylim=y_lim, xlab="Column1", ylab="Column2")
     title("Classifier")
     
     neg_correct_ind <- setdiff(1:nrow(neg_examples), mistakes0)
     pos_correct_ind <- setdiff(1:nrow(pos_examples), mistakes1)
     
     # negative correct examples are green circles
     if(length(neg_correct_ind) > 0) points(neg_examples[neg_correct_ind, 1], neg_examples[neg_correct_ind, 2], type="p", col="green", pch=1, cex=2)
     
     # positive correct examples are green squares
     if(length(pos_correct_ind) > 0) points(pos_examples[pos_correct_ind, 1], pos_examples[pos_correct_ind, 2], type="p", col="green", pch=0, cex=2)
     
     # negative incorrect examples are red circles
     if(length(mistakes0) > 0) points(neg_examples[mistakes0, 1], neg_examples[mistakes0, 2], type="p", col="red", pch=1, cex=2)
     
     # positive incorrect examples are red squares
     if(length(mistakes1) > 0) points(pos_examples[mistakes1, 1], pos_examples[mistakes1, 2], type="p", col="red", pch=0, cex=2)
     
     # plot the decision line
     lines(c(-5,5), c((-w[length(w)]+5*w[1])/w[2],(-w[length(w)]-5*w[1])/w[2]))
   
     
     # Number of mistakes made thus far
     x_lim <- c(-1, max(15, length(num_err_history)))
     y_lim <- c(0, nrow(neg_examples) + nrow(pos_examples) + 1)
     plot(0:(length(num_err_history)-1), num_err_history, xlim=x_lim, ylim=y_lim, xlab="Iteration", ylab="Number of errors", main="Number of errors", type="l")
     
     # Distance to generously feasible weight vector
     x_lim <- c(-1, max(15, length(num_err_history)))
     y_lim <- c(0, 15)
     plot(0:(length(w_dist_history)-1), w_dist_history, xlab="Iteration", ylab="Distance", main="Distance", type="l")
     
}
###############################################
# Run perceptron for each data set

source("Perceptron Learning Algorithm/ImportDatasets.R")
source("Perceptron Learning Algorithm/LearnPerceptron.R")

with(dataset4, 
     learn_perceptron(neg.examples.nobias, pos.examples.nobias, w.init, w.gen.feas)
)

learn_perceptron(dataset1$neg.examples.nobias, dataset1$pos.examples.nobias, dataset1$w.init, dataset1$w.gen.feas)

fn <- function(x) nrow(x)

fn(dataset1$neg.examples.nobias)

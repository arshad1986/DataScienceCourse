nn
============
The nn package is used for building neural networks. It is divided into modular objects that share a common Module interface. Modules have a forward() and backward() method that allow them to feedforward and backpropagate, respectively. Modules can be joined together using module composites, like Sequential, Parallel and Concat to create complex task-tailored graphs. Simpler modules like Linear, Tanh and Max make up the basic component modules. This modular interface provides first-order automatic gradient differentiation. What follows is an example use-case for building a multilayer perceptron using Modules:
<pre><code>
> mlp = nn.Sequential()
> mlp:add( nn.Linear(10, 25) ) -- 10 input, 25 hidden units
> mlp:add( nn.Tanh() ) -- some hyperbolic tangent transfer function
> mlp:add( nn.Linear(25, 1) ) -- 1 output
> =mlp:forward(torch.randn(10))
-0.1815
[torch.Tensor of dimension 1]
</code></pre>
Loss functions are implemented as sub-classes of Criterion, which has a similar interface to Module. It also has forward() and backward methods for computing the loss and backpropagating gradients, respectively. Criteria are helpful to train neural network on classical tasks. Common criteria are the Mean Squared Error criterion implemented in MSECriterion and the cross-entropy criterion implemented in ClassNLLCriterion. What follows is an example of a Lua function that can be iteratively called to train an mlp Module on input Tensor x, target Tensor y with a scalar learningRate:

<pre><code>
function gradUpdate(mlp,x,y,learningRate)
  local criterion = nn.ClassNLLCriterion()
  pred = mlp:forward(x)
  local err = criterion:forward(pred, y); 
  mlp:zeroGradParameters();
  local t = criterion:backward(pred, y);
  mlp:backward(x, t);
  mlp:updateParameters(learningRate);
end
</code></pre>
It also has StochasticGradient class for training a neural network using ***Stochastic gradient descent***, although the **Optim** package provides much more options in this respect, like momentum and weight decay regularization.

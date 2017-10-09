function [J, grad] = lrCostFunction(theta, X, y, lambda)

m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

parameterized_examples = X*theta;
exp = e .^ -parameterized_examples;
plu_one = exp .+ 1;
sigmoid = plu_one .^ -1;

firstTerm = -y .* log(sigmoid);
secondTerm = (1-y) .* log(1-sigmoid);

errorThetas = [0; theta(2:end)];
thirdTerm = (lambda/(2*m))*sum(errorThetas .* errorThetas);
J = (1/m) * sum(firstTerm - secondTerm)+thirdTerm;

grad = grad(:);

B = sigmoid - y;

grad = (X'*B)/m + (lambda/m)*errorThetas;


end

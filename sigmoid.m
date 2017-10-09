function g = sigmoid(z)

g = zeros(size(z));

rows = size(z)(1);
cols = size(z)(2);
for i=1:rows,
	for j=1:cols,
		g(i,j) = 1/ (1+e^(-z(i,j)));
	end;
end;

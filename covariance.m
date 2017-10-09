function g = covariance(vector,degree)

zers = zeros(degree, 1);

top_vec = [zers;vector];
bottom_vec = [vector;zers];

result = bottom_vec .- top_vec;

for i=1:degree
	result(1)=[];
end
for i=1:degree
	result(size(result))=[];
end

g = result;

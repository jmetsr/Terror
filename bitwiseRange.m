function [amt] = bitwiseRange(vector, st, en)
	v1 = vector >= st;
	v2 = vector <= en;
	amt = sum(v1&v2);
end
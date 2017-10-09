data=load('terror_data.txt');

data= sort(data);

terror_attacks = data .- 39110;
% each element of data represents number of days after January 28 2007
% a terror attack occured.

DAYS_SINCE_JAN = 3831;
SC = 145
dates = zeros(DAYS_SINCE_JAN-(SC-2), 1);

for i=1:size(terror_attacks);
	date_of_attack = terror_attacks(i);
	if date_of_attack > 144
		dates(date_of_attack-144) = 1;
	end
end

% Ramadan 2007 starts on September 13.
% It lasts for 30 days
% Then 324 days without Ramadan
% so to find out if a day falls out on Ramadan, take 
% the date mod 354.
% If the number is from 228 to 257 it's ramadan

%%%%%%%
% Build features
%%%%%%%
%%% 
% add constant terms
numbDates = size(dates)(1);



X = [];

for i=144:(numbDates+143)
	%the following code is ineffecent
	f2 = sum(terror_attacks==i);
	f3 = sum(terror_attacks==(i-1));
	f4 = sum(terror_attacks==(i-2));
	f5 = bitwiseRange(terror_attacks,i-4,i-3);
	f6 = bitwiseRange(terror_attacks,i-7,i-5);
	f7 = bitwiseRange(terror_attacks,i-12,i-8);
	f8 = bitwiseRange(terror_attacks,i-20,i-13);
	f9 = bitwiseRange(terror_attacks,i-33,i-21);
	f10 = bitwiseRange(terror_attacks,i-54,i-34);
	f11 = bitwiseRange(terror_attacks,i-88,i-55);
	f12 = bitwiseRange(terror_attacks,i-143,i-89);

	X(i-143,:) = [1 f2 f3 f4 f5 f6 f7 f8 f9 f10 f11 f12];

end

%%%
% add Ramadan Data
%%%
X = [X zeros(size(X,1),1)];
for i=1:numbDates
	day = i + SC - 1;
	if mod(day,354) >= 228 && mod(day,354) <= 257
		X(i,13)=1;
	end
end

%%%
% next we find the Paramaters
%%%

% trainingX = [];
% trainingY = [];
% for i=1:2763
% 	trainingX(i,:) = X(i+924,:);
% 	trainingY(i,1) = dates(i+924);
% end

lambda = 10;


initial_theta = ones(13, 1);

options = optimset('GradObj', 'on', 'MaxIter', 200);
[theta] = ...
    fmincg (@(t)(lrCostFunction(t, X, dates, lambda)), ...
        initial_theta, options);

% testX = [];
% testY = [];

% for i=1:924
% 	testX(i,:) = X(i,:);
% 	testY(i,1) = dates(i);
% end
probs = [];

bin1 = [];
bin2 = [];
bin3 = [];




% for i=1:size(testX)(1)
% 	data_row = testX(i,:);
% 	prob = sigmoid(theta' * data_row');
% 	if prob <= .03
% 		bin1 = [bin1 testY(i,1)];
% 	end
% 	if prob > .03 && prob <= .06
% 		bin2 = [bin2 testY(i,1)];
% 	end
% 	if prob > .06 
% 		bin3 = [bin3 testY(i,1)];
% 	end
% 	probs = [prob probs];

% end









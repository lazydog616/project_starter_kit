function [ yfit ] = crossfun_libsvm( xtrain, ytrain, xtest, rbf_sigma )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
%lib svm
model = svmtrain(ytrain, xtrain , sprintf('-s 0 -t 2 -g %g -c %g-h 0', rbf_sigma,1));
testing_label_vector = zeros(size(xtest, 1), 1); 
[yfit, accuracy, decision_values] = svmpredict(testing_label_vector, xtest, model);

% %matlab svm lib
% svmStruct = svmtrain(xtrain,ytrain,'Kernel_Function','rbf',...
%   'rbf_sigma',rbf_sigma,'boxconstraint',boxconstraint);
% yfit = svmclassify(svmStruct,xtest);

end


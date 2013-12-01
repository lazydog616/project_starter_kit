function [ searchmin ] = find_opt_para_libsvm( xtrain, ytrain )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%for lib svm
tic
minfn = @(z)CrossValLibsvm(z,xtrain, ytrain, 5);
opts = optimset('TolX',5e-4,'TolFun',5e-4, 'MaxFunEvals', 10);
[searchmin fval] = fminsearch(minfn,1/size(xtrain,2),opts);
fval
searchmin

toc


end


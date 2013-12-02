function [ searchmin ] = find_opt_para( xtrain,ytrain )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%%for linear svm lib: searchmin:w1 w2 w3 w4 w5 c
tic

%z = [rbf_sigma,boxconstraint];
minfn = @(z)CrossVal(z, xtrain, ytrain, 5);
opts = optimset('TolX',5e-4,'TolFun',5e-4, 'MaxFunEvals',20000);
[searchmin fval] = fminsearch(minfn,[ 1.6114    1.5839    0.7723    0.7239    0.6707],opts);
fval
searchmin
toc
end


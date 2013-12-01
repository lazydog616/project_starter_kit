function [ searchmin ] = find_opt_para( xtrain,ytrain )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%%for linear svm lib: searchmin:w1 w2 w3 w4 w5 c
tic

%z = [rbf_sigma,boxconstraint];
minfn = @(z)CrossVal(z, xtrain, ytrain, 5);
opts = optimset('TolX',5e-4,'TolFun',5e-4, 'MaxFunEvals', 600);
[searchmin fval] = fminsearch(minfn,2 * rand(1,5),opts);
fval
searchmin
toc
end


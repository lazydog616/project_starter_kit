function [ searchmin ] = find_opt_para( xtrain,ytrain )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%%for linear svm lib: searchmin:w1 w2 w3 w4 w5 c
tic

%z = [rbf_sigma,boxconstraint];
minfn = @(z)CrossVal(z, xtrain, ytrain, 5);
%opts = optimset('TolX',5e-4,'TolFun',5e-4, 'MaxFunEvals', 600);
options = optimoptions('fmincon','Algorithm','interior-point');
start = [0.5004    1.2060    1.0728    1.3758    0.6470];
[searchmin fval] = fmincon(minfn,start,[],[],[],[],[0.3 0.5 0.5 0.5 0.3],[1 1.5 1.5 1.5 1], [], options);
%[searchmin fval] = fminsearch(minfn,2 * rand(1,5),opts);
fval
searchmin
toc
end


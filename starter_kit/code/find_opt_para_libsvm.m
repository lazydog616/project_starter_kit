function [ searchmin, fval, fval_v ] = find_opt_para_libsvm( xtrain, ytrain, iter )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

%for lib svm
tic
% minfn = @(z)CrossValLibsvm(z,xtrain, ytrain, 5);
% opts = optimset('TolX',5e-4,'TolFun',5e-4, 'MaxFunEvals', iter);
% [searchmin fval] = fminsearch(minfn,1/size(xtrain,2),opts);
para_matrix = 0:0.01:1;
fval_v = ones(numel(para_matrix),1);
for i = 1:numel(para_matrix)
    fval_v(i) = CrossValLibsvm(para_matrix(i), xtrain, ytrain, 5);
end
[fval, I] = min(fval_v);
fval
searchmin = para_matrix(I, :)

toc


end


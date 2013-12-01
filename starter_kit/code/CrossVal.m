function [ fval ] = CrossVal( z, xtrain, ytrain, nfold )
%UNTITLED Summary of this function goes here
%   z = [w1 w2 w3 w4 w5]
c = cvpartition(size(xtrain,1),'kfold',nfold);
fval = crossval('mse',xtrain,ytrain,'Predfun', ...
    @(xtrain,ytrain,xtest)crossfun(xtrain,ytrain,...
    xtest,1,z(1),z(2),z(3),z(4),z(5)),'partition',c);

end


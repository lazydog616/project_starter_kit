function [ fval ] = CrossValLibsvm( z, xtrain, ytrain, nfold )
%UNTITLED4 Summary of this function goes here
%   Detailed explanation goes here
c = cvpartition(size(xtrain,1),'kfold',nfold);
fval = crossval('mse',xtrain,ytrain,'Predfun', ...
    @(xtrain,ytrain,xtest)crossfun_libsvm(xtrain,ytrain,...
    xtest,z),'partition',c);

end


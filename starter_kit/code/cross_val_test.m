clear;
load ../data/review_dataset.mat;
load ../data/x_t.mat
Xt_counts = x_t;
Yt = train.labels;
Xq_counts = quiz.counts;
%z = [w1 w2 w3 w4 w5]
%z = [0.1619    0.1405    0.2882    0.5134    0.1186 ];result:0.9406
%z = [0.1045    0.5806    0.7576    1.0561    0.0382 ];% result : 0.96
%z = [ 0.1780    0.4099    0.5064    0.4155    0.1668 ];%result: 0.9017
z = [ 0.1165    0.2814    0.3468    0.3237    0.1078 ];%result:0.8934
%z = [c, w1, w2, w3 w4 w5]
%z = [0.7853    0.1432    0.3979    0.2104    0.6213    0.1136];%result: 0.9087
%z = [ 0.3126    0.7798    0.9314    1.3306    1.5378    0.4674 ];%result:0.8491
c = cvpartition(size(Xt_counts,1),'kfold',10);
fval = crossval('mse',Xt_counts,Yt,'Predfun', ...
    @(xtrain,ytrain,xtest)crossfun(xtrain,ytrain,...
    xtest,1,z(1),z(2),z(3),z(4),z(5)),'partition',c)
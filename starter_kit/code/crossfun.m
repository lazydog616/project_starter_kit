function yfit = crossfun(xtrain,ytrain,xtest,c,w1,w2,w3,w4,w5)

% Train the model on xtrain, ytrain, 
% and get predictions of class of xtest

%%linear svm lib
model = train(ytrain,xtrain,sprintf('-c %g -q -w1 %g -w2 %g -w3 %g -w4 %g -w5 %g',c,w1,w2,w3,w4,w5));

[yfit, accuracy, dec_values] = predict(zeros(size(xtest,1),1), xtest, model);


end
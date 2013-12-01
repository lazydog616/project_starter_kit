clear;
load ../data/review_dataset.mat;
load ../data/x_newtrain.mat;
load ../data/x_newquiz.mat
 Xt_counts = x_newtrain;
 Yt = train.labels;
%Xq_counts = quiz.counts;
%[ para ] = find_opt_para( Xt_counts,Yt);   
[ para ] = find_opt_para_libsvm(Xt_counts, Yt);

% model = train(Yt,Xt_counts,sprintf('-c 1 -q -w1 %g -w2 %g -w3 %g -w4 %g -w5 %g',0.1165, 0.2814, 0.3468, 0.3237, 0.1078));
% 
% [yfit, accuracy, dec_values] = predict(zeros(size(x_t(20001 : end, :),1),1), x_t(20001 : end, :), model);
% 
% mse = sqrt((train.labels(20001 : end) - yfit).^2/5000)
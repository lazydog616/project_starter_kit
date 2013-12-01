%clear;
load ../data/review_dataset.mat
%addpath .\libsvm-3.17\matlab\
%addpath .\libsvm-3.17
load ../data/x_quiz_reduced_tftidf_normal.mat
load ../data/x_t.mat
Xt_counts = train.counts;
Yt = train.labels;
Xq_counts = quiz.counts;
initialize_additional_features;
%% Run algorithm
rates = predict_rating(Xt_counts, Xq_counts, Xt_additional_features,...
                       Xq_additional_features, Yt);

%% Save results to a text file for submission
dlmwrite('submit.txt',rates,'precision','%d');
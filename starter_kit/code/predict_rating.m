function rates = predict_rating(Xt_counts, Xq_counts, Xt_additional_features,...
                                Xq_additional_features, Yt)
% Returns the predicted ratings, given wordcounts and additional features.
%
% Usage:
%
%   RATES = PREDICT_RATING(XT_COUNTS, XQ_COUNTS, XT_ADDITIONAL_FEATURES, ...
%                         XQ_ADDITIONAL_FEATURES, YT);
%
% This is the function that we will use for checkpoint evaluations and the
% final test. It takes a set of wordcount and additional features and produces a
% ranking matrix as explained in the project overview.
%
% This function SHOULD NOT DO ANY TRAINING. This code needs to run in under
% 10 minutes. Therefore, you should train your model BEFORE submission, save
% it in a .mat file, and load it here.

% YOUR CODE GOES HERE
% THIS IS JUST AN EXAMPLE
N = size(Xq_counts, 1);
%%for liblinear
model = train(Yt,Xt_counts,sprintf('-c 1 -q -w1 %g -w2 %g -w3 %g -w4 %g -w5 %g',0.1165, 0.2814, 0.3468, 0.3237, 0.1078));

[yfit, accuracy, dec_values] = predict(zeros(size(Xq_counts,1),1), Xq_counts, model);


%%for libsvm 
%model = svmtrain(Yt, Xt_counts , '-s 1 -t 2 ');
%testing_label_vector = randi(5, size(Xq_counts, 1), 1);
%[predicted_label, accuracy, decision_values] = svmpredict(testing_label_vector, Xq_counts, model);

rates = int8(yfit);

end

function feature = get_new_feature(feature)

% x_newtrain = get_new_feature(train.counts);
% x_newquiz = get_new_feature(quiz.counts);
tic
load ../train_model/grouped_index.mat
load ../train_model/index_not_core.mat
load ../train_model/idf.mat

feature = combined_feature(feature,grouped_index);
feature(:,index_not_core) = [];
feature = get_tfidf(feature, idf);
feature = get_normal(feature);
toc

end
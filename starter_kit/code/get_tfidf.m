function tfidfvalue = get_tfidf(features, idf)

% idf = get_idf(features);

tic
tfidfvalue= bsxfun(@times,features,idf);

toc
end
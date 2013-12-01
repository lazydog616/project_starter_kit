function x = combined_feature(x,grouped_index)
tic

group_size = size(grouped_index,2);
index_to_remove = [];

for i = 1:group_size
    vect = grouped_index{i};
    x(:,vect(1)) = sum(x(:,vect),2);
    index_to_remove = [index_to_remove, vect(2:end)];
end

x(:,index_to_remove) = [];

toc
end
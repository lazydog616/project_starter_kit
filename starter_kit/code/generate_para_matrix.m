function [ para_matrix ] = generate_para_matrix( lb, ub, step )
%geberate_para_matrix : func to generate the parameter matrix for grid
%search
% lb: 1 x N vector, lower bound for parameters
% ub: 1 x N vector, upper bound for parameters
% step: 1 x N vector, step for related parameters

para_size = ceil((ub - lb)./step);
step = (ub -lb)./para_size;
para_size = para_size + 1;

para_num = numel(ub);
row = 1;
for i = 1 : para_num
    row = row * para_size(i);
end
%para_matrix = zeros(row, para_num);
if(~isnan(step(1))&&~isinf(step(1)))
    para_matrix = lb(1) : step(1) : ub(1);
else 
    para_matrix = lb(1);
end

para_matrix = para_matrix';
for i = 2 : para_num
     new_col = lb(i) .* ones(size(para_matrix,1),1);
    if(~isnan(step(i))&&~isinf(step(i)))
        tmp = lb(i) : step(i) : ub(i);
        tmp = tmp';
        para_row_size = size(para_matrix,1);
        para_matrix = repmat(para_matrix, para_size(i),1);
        new_col = zeros(size(para_matrix,1),1);
        for j = 1 : para_size(i)
            new_col((j-1)*para_row_size+1 : j*para_row_size, 1) = tmp(j);
        end
    end
    para_matrix = [para_matrix new_col];
        
    
   
    
end

end


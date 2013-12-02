function [ searchmin,fval,fval_v ] = find_opt_para_grid_search( xtrain,ytrain,para_matrix )
%find_opt_para_grid_search Summary of this function goes here
%   Detailed explanation goes here
%   searchmin: the parameters which achieve the minimun value
%   fval: the minimun cross validation error
%   fval_v: cross validation error of all parameters
    
    [row_size, col_size] = size(para_matrix);
    fval = 1000;
    searchmin = zeros(5,1);
    fval_v = 1000*ones(row_size,1);
    for i = 1:row_size
        fval_v(i) = CrossVal( para_matrix(i,:), xtrain, ytrain, 5 );
        
    end
    [fval, I] = min(fval_v);
    fval
    searchmin = para_matrix(I,:)
end


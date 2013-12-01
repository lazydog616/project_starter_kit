function normal_value = get_normal(input_feature)

normal_value = bsxfun(@times, input_feature, 1./(max(sqrt(sum(input_feature.^2, 2)), eps)));


end
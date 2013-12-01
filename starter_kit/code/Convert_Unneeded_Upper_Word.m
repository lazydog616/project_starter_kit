function [ x ] = Convert_Unneeded_Upper_Word( x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
 if numel(x)<=1&&x == 'I'
     x = 'i';
 end

end


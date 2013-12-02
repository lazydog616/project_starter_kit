function [ text_features ] = get_text_info( metadata )
%get text info additional feature: calculate amount of related punctuation
%1st col : ! ; 2nd col : ? ; 3rd col : :) + ;) ; 4th col: all uppercase word ; 5th col : text length ; 
tic
text_features = zeros(numel(metadata), 5);
for i = 1 : numel(metadata)
    if(~isempty(metadata(i).text))
        tmp = cell(size(metadata(i).text,1),1);
        [tmp{:,:}] = deal('!');
        re = cellfun(@(x,y)strfind(x,y), metadata(i).text, tmp,'UniformOutput', false);
        text_features(i, 1) = sum(cellfun(@numel,re));
        
        [tmp{:,:}] = deal('?');
        re = cellfun(@(x,y)strfind(x,y), metadata(i).text, tmp,'UniformOutput', false);
        text_features(i, 2) = sum(cellfun(@numel,re));
        
        [tmp{:,:}] = deal(':)');
        re = cellfun(@(x,y)strfind(x,y), metadata(i).text, tmp,'UniformOutput', false);
        text_features(i, 3) = sum(cellfun(@numel,re));
        
        [tmp{:,:}] = deal(';)');
        re = cellfun(@(x,y)strfind(x,y), metadata(i).text, tmp,'UniformOutput', false);
        text_features(i, 3) = text_features(i, 3) + sum(cellfun(@numel,re));
        
        raw_text = cellfun(@(x)Convert_Unneeded_Upper_Word(x), metadata(i).text,'UniformOutput', false);
        re = cellfun(@(x)isstrprop(x, 'upper'), raw_text,'UniformOutput', false);
        text_features(i, 4) = sum(cellfun(@(x)(sum(x==0)==0),re));
        
        text_features(i, 5) = size(metadata(i).text, 1);
    end
    
end
text_features = sparse(text_features);
toc

end


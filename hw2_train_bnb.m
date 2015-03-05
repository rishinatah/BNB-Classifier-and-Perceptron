function params = hw2_train_bnb(X,Y)

% labels
uniqueLabels = unique(Y);
len = length(uniqueLabels);


%BNB

params = struct();

total = length(Y);

for i = 1 : len
    class = uniqueLabels(i);
    params(i).pi = histc(Y,class)/total;
    % class prior calculated
    X1 = X(Y == class,:);
    numWords = numel(X1);
    pjkDen = 2 + numWords;
    numWordsK = sum(X1(:));
    pjkNumer = 1 + numWordsK;
    params(i).pjk = pjkNumer / pjkDen ;
    % class conditional calculated
end

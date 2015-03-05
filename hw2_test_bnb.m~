function preds = hw2_test_bnb(params,test,testlabels)

% test = testdata
len = size(test);
len = len(1)
numClass = 20;
plugStruct = struct();

for i = 1 : len
    i
   
    for j = 1 : numClass
        log1 = log((params(j).pjk));
        log2 = log((1 - params(j).pjk));

        plugTot = bsxfun(@plus ,bsxfun(@times,test(i,:),log1) , bsxfun(@times,test(i,:),log2));
        plugInClassifier = params(j).pi * sum(plugTot);
        plugInClass(j) = plugInClassifier;
        plugStruct(i).plug = plugInClass;
    end
    maxVal = max([plugStruct(i).plug]);
    predClass = find([plugStruct(i).plug] == maxVal);
    
    preds(i) = predClass;
    
end


preds = transpose(preds);
errorMat = eq(preds,testlabels);
testError = ((length(testlabels) - sum(errorMat))/length(testlabels)) *100
testError



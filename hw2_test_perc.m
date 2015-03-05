function preds = hw2_test_perc(params,test)

testSize = size(test);
len = testSize(1);

for i = 1 : len
    yPred(i) = sign(bsxfun(@times,params,test(i,:))); 
end

yPred = transpose(yPred);
preds = yPred;







end
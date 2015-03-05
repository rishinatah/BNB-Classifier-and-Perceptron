function params = hw2_train_perc( X,Y,num_passes )
% Perceptron implementation
% this function returns a linear classfier
sizeData = size(X);
N = sizeData(1);
M = sizeData(1,2);

w_init = zeros(M + 1,1);

X_perc = [ones(N,1) X];

for t = 1 
    for i = 1 : N
        YpredTemp = sign(transpose(w_init) * transpose(X_perc(i,:)));
        if YpredTemp ~= Y(i)
            w_tplus1 = bsxfun(@plus,w_init,bsxfun(@times,Y(i),X_perc(i,:)));
        else
            w_tplus1 = w_init;
        end
        w_init = w_tplus1;
    end
end

params = w_tplus1;

end


function params = hw2_train_avgperc( X,Y,num_passes )
% Averaged Perceptron implementation
% this function returns a linear classfier
sizeData = size(X);
N = sizeData(1);
M = sizeData(1,2);

w_init = zeros(M + 1,1);
v_init = zeros(M + 1,1);
X_perc = [ones(N,1) X];

for t = 1 
    for i = 1 : N
        YpredTemp = sign(Y(i) * (transpose(v_init) * transpose(X_perc(i,:))));
        if YpredTemp < 0
            v_tplus1 = bsxfun(@plus,v_init,bsxfun(@times,Y(i),X_perc(i,:)));
            w_tplus1 = w_init + v_tplus1;
        else
            w_tplus1 = w_init;
            v_tplus1 = v_init;
        end
        w_init = w_tplus1;
        v_init = v_tplus1;
    end
    w = (1/N) * w_tplus1;
end

params = w;

end


%--------------------------------------------------------------------------
% Homework 2 script

num_trials = 5;
sizes = [500;1000;1500;size(data,1)];
results_bnb = zeros(length(sizes),num_trials);
results_op1 = zeros(length(sizes),num_trials);
results_op5 = zeros(length(sizes),num_trials);
results_ap1 = zeros(length(sizes),num_trials);
results_ap5 = zeros(length(sizes),num_trials);
for i = 1:length(sizes)
  for j = 1:num_trials
    fprintf('size = %d, trial = %d\n', sizes(i), j);
    I = randsample(size(data,1),sizes(i));
    bnb_model = hw2_train_bnb(data(I,:),labels(I));
    results_bnb(i,j) = mean(hw2_test_bnb(bnb_model,testdata) ~= transpose(testlabels));
    op1_model = hw2_train_perc(data(I,:),labels(I),1);
    results_op1(i,j) = mean(hw2_test_perc(op1_model,testdata) ~= transpose(testlabels));
    op5_model = hw2_train_perc(data(I,:),labels(I),5);
    results_op5(i,j) = mean(hw2_test_perc(op5_model,testdata) ~= transpose(testlabels));
    ap1_model = hw2_train_avgperc(data(I,:),labels(I),1);
    results_ap1(i,j) = mean(hw2_test_perc(ap1_model,testdata) ~= transpose(testlabels));
    ap5_model = hw2_train_avgperc(data(I,:),labels(I),5);
    results_ap5(i,j) = mean(hw2_test_perc(ap5_model,testdata) ~= transpose(testlabels));
  end
end
figure(1);c1
hold on;
errorbar(sizes, mean(results_bnb,2), std(results_bnb,1,2));
errorbar(sizes, mean(results_op1,2), std(results_op1,1,2));
errorbar(sizes, mean(results_op5,2), std(results_op5,1,2));
errorbar(sizes, mean(results_ap1,2), std(results_ap1,1,2));
errorbar(sizes, mean(results_ap5,2), std(results_ap5,1,2));
legend('BNB', 'OP1', 'OP5', 'AP1', 'AP5');
xlabel('number of training data');
ylabel('test error');

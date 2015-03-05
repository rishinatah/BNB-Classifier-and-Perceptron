function [words,weights] = hw2_topwords(weight_vector,num_words)
%hw2_topwords
%   [words,weights] = hw2_topwords(weight_vector,num_words)
%
%   Returns a [num_words x 1] cell array containing the words of highest
%   weight (by magnitude) in the [ 61188 x 1 ] weight_vector, as well as
%   the corresponding weights in a [num_words x 1] array.
%
%   The file 'news.vocab' must be in the current directory.

if length(weight_vector) ~= 61188
  error('Weight vector has incorrect dimensinos.');
end
vocab = textscan(fileread('news.vocab'),'%s');
vocab = vocab{1};
[~,i] = sort(abs(weight_vector), 'descend');
words = vocab(i(1:num_words));
weights = weight_vector(i(1:num_words))';

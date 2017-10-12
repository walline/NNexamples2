function [output,b] = FeedForward(input,weights,threshold,beta)

input = reshape(input,[],1);
weights = reshape(weights,[],1);


b = input'*weights+threshold;
output = tanh(beta*b);
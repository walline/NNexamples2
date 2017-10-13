function [weights, threshold] = UpdateNetwork(output, input, referenceValue, b, weights, threshold, beta, eta)

weights = reshape(weights,[],1);
input = reshape(input,[],1);

delta = TanhPrime(b,beta)*(referenceValue-output);
deltaWeights = eta*input*delta;
deltaThreshold = -eta*delta;

weights = weights+deltaWeights;
threshold = threshold+deltaThreshold;
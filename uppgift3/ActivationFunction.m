function [g, index] = ActivationFunction(inputPattern,weights)

inputPattern = reshape(inputPattern,1,2);
weights = reshape(weights,[],2);

nrOfWeights = size(weights,1);


tmpMat = repmat(inputPattern,nrOfWeights,1)-weights;
numerator = exp(-sqrt(sum(tmpMat.^2,2)).^2./2);
denominator = sum(numerator,1);

g = numerator./denominator;

[~, index] = max(g);





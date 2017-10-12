function networkMatrix = UpdateWeights(networkMatrix,inputPattern,...
    sigma,eta)

nbrOfOutputNeurons = size(networkMatrix,1);

for i=1:nbrOfOutputNeurons
    weightCoordinate = networkMatrix(i,:);
    distances(i) = norm(weightCoordinate - inputPattern);
end

[~,closestNeuron] = min(distances);

for i=1:nbrOfOutputNeurons
    neuronWeight = networkMatrix(i,:);
    delta_weights(i,:) = eta*NeighbourhoodFunction(closestNeuron,i,sigma).*...
        (inputPattern - neuronWeight);
    
end

networkMatrix = networkMatrix + delta_weights;

    function omega = NeighbourhoodFunction(index1,index2,sigma)
        omega = exp(-abs(index1-index2).^2./(2*sigma.^2));
    end

end


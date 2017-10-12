clear all, clc, clf, close all
fileName = 'data_ex2_task3_2017.txt';
inputPatterns = importdata(fileName);



eta = 0.02;
numberOfUpdates = 1e5;
nNeurons = 5;
numberOfPatterns = size(inputPatterns,1);

initialWeightsGaussian = -1+2*rand(nNeurons,2);

weightsGaussian = initialWeightsGaussian;

for i = 1:numberOfUpdates
    r = randi(numberOfPatterns);
    chosenPattern = inputPattern(r,2;end);
    [~,index] = ActivationFunction(chosenPattern,weightsGaussian);
    
    deltaWeightsGaussian = eta*(chosenPattern-weightsGaussian(index,:);
    weightsGaussian(index,:) = weightsGaussian(index,:) + deltaWeightsGaussian;
end

beta = 0.5;
nTrainingSteps = 3000;
eta = 0.1;

initialWeights = -1+2*rand(nNeurons,1);
threshold = -1+2*rand();

for i = 1:nTrainingSteps
    r = randi(numberOfPatterns);
    chosenPattern = inputPattern(r,2:end);
    referenceValue = inputPattern(r,1);
    [g, ~] = ActivationFunction(chosenPattern,weightsGaussian);
    
    [output, b] = FeedForward(g,weights,threshold,beta)
    [weights, threshold] = UpdateNetwork(output, g, referenceValue, b, weights,...
                                         threshold, beta, eta);
end




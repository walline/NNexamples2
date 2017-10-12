clear all, clc, clf, close all
fileName = 'data_ex2_task3_2017.txt';
inputPatterns = importdata(fileName);



eta = 0.02;
numberOfUpdates = 1e5;
nNeurons = 5;
numberOfPatterns = size(inputPatterns,1);

initialWeights = -1+2*rand(nNeurons,2);

weights = initialWeights;

for i = 1:numberOfUpdates
    r = randi(numberOfPatterns);
    chosenPattern = inputPattern(r,2;end);
    [~,index] = ActivationFunction(chosenPattern,weights);
    
    deltaWeights = eta*(chosenPattern-weights(index,:);
    weights(index,:) = weights(index,:) + deltaWeights;
end
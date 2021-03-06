clear all, clc, clf, close all
fileName = 'data_ex2_task3_2017.txt';
inputPatterns = importdata(fileName);



eta = 0.02;
numberOfUpdates = 1e5;
nNeurons = 20;
numberOfPatterns = size(inputPatterns,1);

initialWeightsGaussian = -1+2*rand(nNeurons,2);

weightsGaussian = initialWeightsGaussian;

for i = 1:numberOfUpdates
    r = randi(numberOfPatterns);
    chosenPattern = inputPatterns(r,2:end);
    [~,index] = ActivationFunction(chosenPattern,weightsGaussian);
    
    deltaWeightsGaussian = eta*(chosenPattern-weightsGaussian(index,:));
    weightsGaussian(index,:) = weightsGaussian(index,:) + deltaWeightsGaussian;
end

beta = 0.5;
nTrainingSteps = 3000;
eta = 0.1;

initialWeights = -1+2*rand(nNeurons,1);
weights = initialWeights;
threshold = -1+2*rand();

for i = 1:nTrainingSteps
    r = randi(numberOfPatterns);
    chosenPattern = inputPatterns(r,2:end);
    referenceValue = inputPatterns(r,1);
    [g, ~] = ActivationFunction(chosenPattern,weightsGaussian);
    
    [output, b] = FeedForward(g,weights,threshold,beta);
    [weights, threshold] = UpdateNetwork(output, g, referenceValue, b, weights,...
                                         threshold, beta, eta);
end

distanceVec = zeros(numberOfPatterns,1);

for i = 1:numberOfPatterns
    referenceValue = inputPatterns(i,1);
    pattern = inputPatterns(i,2:end);
    [g, ~] = ActivationFunction(pattern,weightsGaussian);
    
    [output, ~] = FeedForward(g,weights,threshold,beta);
    distanceVec(i) = abs(referenceValue - sign(output));
end

error = 1/(2*numberOfPatterns)*sum(distanceVec)

%%
%plot
x = linspace(-15,25,100);
y = linspace(-15,15,100);
[X,Y] = meshgrid(x,y);

input = [x' y'];
outputGrid=zeros(100);
for i = 1:100
    for j=1:100
        pattern = [X(i,j) Y(i,j)];
[g, ~] = ActivationFunction(pattern,weightsGaussian);
[outputGrid(i,j), ~] = FeedForward(g,weights,threshold,beta);
    end
end






clear all, clc, clf, close all
fileName = 'data_ex2_task3_2017.txt';
inputPatterns = importdata(fileName);




numberOfPatterns = size(inputPatterns,1);
nbrOfRuns = 20;

for nNeurons = 1:10

for run=1:nbrOfRuns
    
    eta = 0.02;
    numberOfUpdates = 1e5;
    
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
    
    error(run) = 1/(2*numberOfPatterns)*sum(distanceVec);
    
end

avgError(nNeurons) = mean(error);

end
plot(1:nNeurons,avgError)

xlabel('Number of Gaussian neurons','FontSize',16)
ylabel('Average classification error','FontSize',16)








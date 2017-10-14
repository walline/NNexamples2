clear all, clc, clf, close all
fileName = 'data_ex2_task2_2017.txt';
inputPatterns = importdata(fileName);

numberOfUpdates = 2e4;
initialWeightsCase1 = -1+2*rand(2,1);
initialWeightsCase2 = -1+2*rand(2,1);
eta = 0.001;
numberOfPatterns = size(inputPatterns,1);

meanValues = mean(inputPatterns);
scaledInputPatterns = inputPatterns - repmat(meanValues,numberOfPatterns,1);



weightsCase1 = initialWeightsCase1;
weightsCase2 = initialWeightsCase2;
modulusWeightsCase1 = zeros(1,numberOfUpdates);
modulusWeightsCase2 = zeros(1,numberOfUpdates);

% case 1
for i = 1:numberOfUpdates
    patternNumber = randi(numberOfPatterns);
    chosenPattern = inputPatterns(patternNumber,:);
    zeta = chosenPattern*weightsCase1;
    
    deltaWeights = eta*zeta*(chosenPattern'-zeta*weightsCase1);
    weightsCase1 = weightsCase1 + deltaWeights;
    
    modulusWeightsCase1(i) = norm(weightsCase1);    
end

% case 2
for i = 1:numberOfUpdates
    patternNumber = randi(numberOfPatterns);
    chosenPattern = scaledInputPatterns(patternNumber,:);
    zeta = chosenPattern*weightsCase2;
    
    deltaWeights = eta*zeta*(chosenPattern'-zeta*weightsCase2);
    weightsCase2 = weightsCase2 + deltaWeights;
    
    modulusWeightsCase2(i) = norm(weightsCase2);    
end

subplot(2,2,1)
plot(1:numberOfUpdates,modulusWeightsCase1)
title('Non-centered data')
xlabel('Iterations')
ylabel('|w|')

subplot(2,2,2)
plot(1:numberOfUpdates,modulusWeightsCase2)
title('Centered data')
xlabel('Iterations')
ylabel('|w|')

weightsCase1
subplot(2,2,3)
plot(inputPatterns(:,1),inputPatterns(:,2),'o')
hold on
quiver(0, 0,weightsCase1(1), weightsCase1(2),5,'color','green','LineWidth',1,'MaxHeadSize',0.3)
xlabel('x_1')
ylabel('x_2')

subplot(2,2,4)
plot(scaledInputPatterns(:,1),scaledInputPatterns(:,2),'o')
hold on
quiver(0, 0,weightsCase2(1), weightsCase2(2),'color','green','LineWidth',1,'MaxHeadSize',1.5)
xlabel('x_1')
ylabel('x_2')

CMatrix = zeros(2);

for i=1:numberOfPatterns
    xi = scaledInputPatterns(i,:);
    CMatrix = CMatrix + xi'*xi;
end

CMatrix = CMatrix/numberOfPatterns;


[eigenvectors,eigenvalues] = eig(CMatrix);

[~,index] = max(sum(eigenvalues));

principalComponent = eigenvectors(index,:);




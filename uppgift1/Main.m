clc
clear all
close all

T_order = 1000;
sigma_0 = 100;
eta_0 = 0.1;
tau_sigma = 300;

nbrOfInputPatterns = 1000;

patterns = GeneratePatterns(nbrOfInputPatterns);

networkDimensions = [2 100];
weightInterval = [-1 1];

network = InitializeNetwork(networkDimensions, weightInterval);
networkMatrix = network{1,1};
for i=1:T_order
    
    r = randi(nbrOfInputPatterns);
    randomPattern = patterns(r,:);
    eta = eta_0*exp(-i/tau_sigma);
    sigma = sigma_0*exp(-i/tau_sigma);
    
    networkMatrix = UpdateWeights(networkMatrix,randomPattern,...
        sigma,eta);
    
end

xvertices = [0, 0, 1, 1, 0.5, 0.5];
yvertices = [0, 1, 1, 0.5, 0.5, 0];

subplot(1,2,1);
patch(xvertices,yvertices,'black','EdgeColor','none','FaceAlpha',0.2)
hold on
plot(networkMatrix(:,1),networkMatrix(:,2))
title('Weight vectors after ordering phase')
xlabel('x_1')
ylabel('x_2')
axis square


T_conv = 2e4;
sigma_conv = 0.9;
eta_conv = 0.01;

for i = 1:T_conv    
    r = randi(nbrOfInputPatterns);
    randomPattern = patterns(r,:);
    
    networkMatrix = UpdateWeights(networkMatrix,randomPattern,...
        sigma_conv,eta_conv);   
end

subplot(1,2,2);
patch(xvertices,yvertices,'black','EdgeColor','none','FaceAlpha',0.2)
hold on
plot(networkMatrix(:,1),networkMatrix(:,2))
title('Weight vectors after convergence phase')
xlabel('x_1')
ylabel('x_2')
axis square

%%

clc
clear all
close all

T_order = 1000;
sigma_0 = 5;
eta_0 = 0.1;
tau_sigma = 300;

nbrOfInputPatterns = 1000;

patterns = GeneratePatterns(nbrOfInputPatterns);

networkDimensions = [2 100];
weightInterval = [-1 1];

network = InitializeNetwork(networkDimensions, weightInterval);
networkMatrix = network{1,1};
for i=1:T_order
    
    r = randi(nbrOfInputPatterns);
    randomPattern = patterns(r,:);
    eta = eta_0*exp(-i/tau_sigma);
    sigma = sigma_0*exp(-i/tau_sigma);
    
    networkMatrix = UpdateWeights(networkMatrix,randomPattern,...
        sigma,eta);
    
end

xvertices = [0, 0, 1, 1, 0.5, 0.5];
yvertices = [0, 1, 1, 0.5, 0.5, 0];

subplot(1,2,1);
patch(xvertices,yvertices,'black','EdgeColor','none','FaceAlpha',0.2)
hold on
plot(networkMatrix(:,1),networkMatrix(:,2))
title('Weight vectors after ordering phase')
xlabel('x_1')
ylabel('x_2')
axis square

T_conv = 2e4;
sigma_conv = 0.9;
eta_conv = 0.01;

for i = 1:T_conv    
    r = randi(nbrOfInputPatterns);
    randomPattern = patterns(r,:);
    
    networkMatrix = UpdateWeights(networkMatrix,randomPattern,...
        sigma_conv,eta_conv);   
end

subplot(1,2,2);
patch(xvertices,yvertices,'black','EdgeColor','none','FaceAlpha',0.2)
hold on
plot(networkMatrix(:,1),networkMatrix(:,2))
title('Weight vectors after convergence phase')
xlabel('x_1')
ylabel('x_2')
axis square
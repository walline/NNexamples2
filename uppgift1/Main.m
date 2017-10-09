T_order = 1000;
sigma_0 = 100;
eta_0 = 0.1;
tau_sigma = 300;

nbrOfDataPoints = 1000;

patterns = GeneratePatterns(nbrOfDataPoints);

networkDimensions = [2 100];
weightInterval = [-1 1];

network = InitializeNetwork(networkDimensions, weightInterval);
networkMatrix = network{1,1};
for i=1:T_order
    
    r = randi(nbrOfDataPoints);
    randomPattern = patterns(r);
    eta = eta_0*exp(-i/tau_sigma);
    sigma = sigma_0*exp(-i/tau_sigma);
    
    networkMatrix = UpdateWeights(networkMatrix,input,...
        sigma,eta);
    
end

subplot(2,1,1);
plot(networkMatrix(1),networkMatrix(2))
title('Weight vectors after ordering phase')
hold on

T_conv = 2e4;
sigma_conv = 0.9;
eta_conv = 0.01;

for i = 1:T_conv    
    networkMatrix = UpdateWeights(networkMatrix,T_order,...
        sigma_conv,eta_conv,tau_sigma);    
end

subplot(2,1,2);
plot(networkMatrix(1),networkMatrix(2))
title('Weight vectors after convergence phase')
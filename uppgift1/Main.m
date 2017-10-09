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

plot 
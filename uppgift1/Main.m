T_order = 1000;
sigma_0 = 100;
eta_0 = 0.1;
tau_sigma = 300;

nbrOfDataPoints = 1000;

input = GeneratePoints(nbrOfDataPoints);

networkDimensions = [2 100];
weightInterval = [-1 1];

network = InitializeNetwork(networkDimensions, weightInterval);
networkMatrix = network{1,1};

for i=1:T_order
    
    UpdateWeights(networkMatrix,T_order,sigma_0,eta_0);
    
end

plot 
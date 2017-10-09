function networkMatrix = UpdateWeights(networkMatrix,input,T_order,sigma_0,...
    eta_0,tau_sigma)

output = networkMatrix*input;
[~,winningNeuron] = max(output);

eta = eta_0*exp(-T_order/tau_sigma);
sigma = sigma_0*exp(-T_order/tau_sigma);

delta_weights() = eta*NeighbourhoodFunction()

end


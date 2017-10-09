function networkMatrix = UpdateWeights(networkMatrix,input,T_order,sigma,...
    eta,tau_sigma)

output = networkMatrix*input;
[~,winningNeuron] = max(output);

eta = eta_0*exp(-T_order/tau_sigma);
sigma = sigma_0*exp(-T_order/tau_sigma);

delta_weights() = eta*NeighbourhoodFunction()

    function omega = NeighbourhoodFunction(index1,index2,sigma)
        omega = exp(-abs(index1-index2)^2/(2*sigma^2));
    end

end


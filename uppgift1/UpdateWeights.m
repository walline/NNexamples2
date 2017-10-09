function networkMatrix = UpdateWeights(networkMatrix,T_order,sigma_0,eta_0)

    function omega = NeighbourhoodFunction(index1,index2,sigma)
        omega = exp(-abs(index1-index2)^2/(2*sigma^2));
    end
        

eta = eta_0*

delta_weights = eta

end


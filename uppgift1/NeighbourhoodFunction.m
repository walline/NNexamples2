function omega = NeighbourhoodFunction(index1,index2,sigma)
        omega = exp(-abs(index1-index2).^2./(2*sigma.^2));
    end
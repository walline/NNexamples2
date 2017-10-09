function inputPoints = GeneratePoints(numberOfPoints)

randomPoints = rand(2*numberOfPoints,2);
condition = and(randomPoints(:,1) > 0.5,randomPoints(:,2) < 0.5);
randomPoints(condition,:) = [];
inputPoints = randomPoints(1:numberOfPoints,:);
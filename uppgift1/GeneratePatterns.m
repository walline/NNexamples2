function inputPatterns = GeneratePatterns(numberOfPatterns)

randomPoints = rand(2*numberOfPatterns,2);
condition = and(randomPoints(:,1) > 0.5,randomPoints(:,2) < 0.5);
randomPoints(condition,:) = [];
inputPatterns = randomPoints(1:numberOfPatterns,:);
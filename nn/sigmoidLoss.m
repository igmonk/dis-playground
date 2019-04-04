function sl = sigmoidLoss(yVec, h, m)

    term1 = yVec .* log(h);
    term2 = (1 - yVec) .* log(1 - h);
    sl = (-1) * sum(sum(term1 + term2)) / m;

end

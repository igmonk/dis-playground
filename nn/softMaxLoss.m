function sml = softMaxLoss(yVec, h, m)

    term = yVec .* log(h);
    sml = (-1) * sum(sum(term)) / m;

end

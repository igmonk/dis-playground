function sm = softMax(x)

  % size(x) = [nRows nCols]

  ee = exp(x); % size(ee) = [nRows nCols]
  s = sum(ee); % size(s) = [1 nCols]
  sm = ee ./ s; % size(sm) = [nRows nCols]
%sm = log(sm);

end

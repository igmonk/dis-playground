function r = invert(m)

  s = size(m);
  r = ones(s, s) .- m;

end

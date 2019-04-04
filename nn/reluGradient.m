function r = reluGradient(a)

  if (a <= 0)
    r = 0;
  else
    r = 1;
  endif;

end

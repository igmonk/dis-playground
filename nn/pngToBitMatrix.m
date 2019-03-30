function result = pngToBitMatrix(fileName)

  img = imread(fileName);
  matrix = rgb2ind(img);
  % Trend line is drawn in black, background is white
  result = invert(matrix);

end

function convertFiles()

  X = [];
  y = [];

  separator = '/';
  baseDir = '../data/ts/img/20x20';
  outFile = strcat(baseDir, separator, 'xy.gen.mat');
  names = {
    '01-hs',
    '02-rhs',
    '03-m',
    '04-w',
    '05-b',
    '06-flag-down',
    '07-flag-up',
    '08-wedge-down',
    '09-wedge-up',
    'circle'
  };

  len = numel(names);
  for i = 1:numel(names)
    dirName = strcat(baseDir, separator, names{i});
    printf('dir name: %s\n', dirName);
    files = readdir(dirName);

    for j = 1:numel(files)
      fileName = files{j};
      ind = strfind(fileName, ".png");
      if (ind != 0)
        fullName = strcat(dirName, separator, fileName);
        imgMatrix = pngToBitMatrix(fullName);
        imgMatrix = double(imgMatrix);
        % Every image matrix is unrolled into 400-dimentional vector
        xRow = imgMatrix(:)';
        X = [X; xRow];
        y = [y; i];
      endif;
    end
  end

  disp(size(X));
  disp(size(y));

  save(outFile, 'X', 'y');

end

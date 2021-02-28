function [m A eigenfaces pr_img] = eigenface_core(database_path)
  D = database_path;
  T =[];
  a = dir([database_path '/*.jpg']);
  S =size(a,1);
  for i = 1 : S
    F = strcat(D,'/',int2str(i),'.jpg');
    I = double(rgb2gray(imread(F)));
    vector = I(:);
    T(:, i) = vector;
   end
   m = [];
   [l, c] = size(T);
  for i = 1 : l
    m = [m; mean(T(i, :))];
  endfor
    A = T - m;
    V1 = [];
    [V D] = eig(A' * A);
    for i = 1 : size (D)
      if D(i, i) > 1
        V1 = [V1, V(:, i)];
      endif
    endfor
    V = V1;
    eigenfaces = A * V;
    pr_img = eigenfaces' * A;
end
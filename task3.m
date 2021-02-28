function [A_k S] = task3(image, k)
  %TODO
  A = imread (image);
  A = double(A);
  miu = [];
  [m, n] = size(A);
  for i = 1 : m
    sum = 0;
    for j = 1 : n
      sum += A(i, j);
    endfor
    media_aritmetica = sum / n;
    miu = [miu, media_aritmetica];
    A(i, :) -= media_aritmetica;
  endfor
  Z = A' / sqrt(n -1);
  [U S V] = svd(Z);
  W = V(:, 1 : k);
  Y = W' * A;
  A_k = (W * Y) + miu';
endfunction
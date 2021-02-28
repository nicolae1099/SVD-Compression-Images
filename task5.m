function task5()
   image = "image3.gif";
   A = double(imread(image));
   interval = [0 : 2 : 130];
   [m ,n] = size(A);
   y2 = [];
   y3 = [];
   y4 = [];
   for k = interval
     % al 2-lea grafic
     sum1 = 0;
     sum2 = 0;
     [A_k, S] = task3(image, k);
     for i = 1 : k
      sum1 += S(i, i);
     endfor
     for i = 1 : min (m, n)
      sum2 += S(i, i);
     endfor
     y2 = [y2, sum1/sum2];
     % al 3-lea grafic
     sum = 0;
      for i = 1 : m
        for j = 1 : n
          sum += (A(i, j) - A_k(i, j))^2;
        endfor
      endfor
    y3 = [y3, sum /(m * n)];
    % graficul 4
    y4 = [y4,(2 * k + 1) / n];
  endfor
  figure(1)
  plot(diag(S))
  figure(2)
  plot(interval, y2);
  figure(3)
  plot(interval, y3);
  figure(4)
  plot(interval, y4);
end
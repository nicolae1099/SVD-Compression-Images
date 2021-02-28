function A_k = task1(image, k)
  %TODO
  A = double(imread (image));
 %J = process_my_image (I);
 %imwrite (A_k, "my_output_image.img");
 [U S V] = svd(A);
 u = U(:, 1:k);
 s = S(1:k, 1:k);
 v = V'(1:k, :);
 A_k = u * s * v;
end
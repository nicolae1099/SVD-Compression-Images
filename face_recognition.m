function [min_dist output_img_index] = face_recognition(image_path, m, A, eigenfaces, pr_img)
    T = [];
    I = double(rgb2gray(imread(image_path)));
    vector = I(:);
    size(vector);
    T = [T, vector];
    vector = T - m;
    PrTestImg = eigenfaces' * vector;
    [l c] = size(pr_img);
    min_dist = norm(PrTestImg - pr_img(:, 1));
    output_img_index = 1;
    for i = 2 : c
      if norm(PrTestImg - pr_img(:, i)) < min_dist
        min_dist = norm(PrTestImg - pr_img(:, i));
        output_img_index = i;
      endif
    endfor
end
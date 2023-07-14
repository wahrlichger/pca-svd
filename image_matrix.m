% Read the image
image_matrix = imread('micro_insect.jpg');


% (MATLAB does not fully support matrix multiplication for integer data types like uint8)
grayscale_image = double(rgb2gray(image_matrix));

% Ensure the image is squared
matrix_size = size(grayscale_image);
row_dimension = matrix_size(1);
column_dimension = matrix_size(2);

if row_dimension ~= column_dimension
    square_size = min(row_dimension, column_dimension);
    grayscale_image = grayscale_image(1:square_size, 1:square_size);
end

% Display the grayscale image
imshow(uint8(grayscale_image));

% Check if the matrix is normal
is_normal = norm(grayscale_image * grayscale_image' - grayscale_image' * grayscale_image) < 1e-10; % Due to rounding errors, set threshold as 1e-10
if is_normal == 0
    disp('Matrix is not normal');
end

% Check if the matrix is symmetric
is_symmetric = isequal(grayscale_image, grayscale_image');
if is_symmetric == 0
    disp('Matrix is not symmetric.');
end

% Calculate the eigenvalues and eigenvectors of the matrix
[eig_vectors, eig_values] = eig(grayscale_image);
eigenvalues = diag(eig_values)';

% Check if the matrix is positive semi-definite and positive definite 
is_psd = all(eigenvalues >= 0);
if is_psd
    disp('Matrix is positive semi-definite');
else
    disp('Matrix is not positive semi-definite');
end

is_pd = all(eigenvalues > 0);
if is_pd
    disp('Matrix is positive definite');
else
    disp('Matrix is not positive definite');
end

% Check if the matrix is diagonalizable
is_diagonalizable = rank(eig_vectors) == size(grayscale_image, 1);
if is_diagonalizable
    disp('Matrix is diagonalizable');
else
    disp('Matrix is not diagonalizable');
end

% Calculate determinant
det_grayscale_image = det(grayscale_image);
disp(['Determinant of Matrix is ', num2str(det_grayscale_image)])

% Calculate rank and trace
rank_grayscale_image = rank(grayscale_image);
trace_grayscale_image = trace(grayscale_image);

disp(['Rank of matrix is ', num2str(rank_grayscale_image)])
disp(['Trace of matrix is ', num2str(trace_grayscale_image)])

% Calculate minimum and maximum singular values
singular_values = svd(grayscale_image);
minimum_singular_value = min(singular_values);
maximum_singular_value = max(singular_values);

disp(['Minimum singular value is ', num2str(minimum_singular_value)])
disp(['Maximum singular value is ', num2str(maximum_singular_value)])

% Calculate 1-norm, 2-norm, and Frobenius norm
norm_1 = norm(grayscale_image, 1);
norm_2 = norm(grayscale_image, 2);
norm_Frobenius = norm(grayscale_image, 'fro');

norm_infos = {'1-norm of matrix is: ', num2str(norm_1), '\n2-norm of matrix is: ', num2str(norm_2),...
              '\nFrobenius norm of matrix is: ', num2str(norm_Frobenius)};
norm_infos_str = strjoin(norm_infos, '');
fprintf(norm_infos_str);

% Calculate condition number
condition_number_of_grayscale_image = cond(grayscale_image);

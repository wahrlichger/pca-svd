
[U, S, V] = svd(grayscale_image);


threshold = 0.99; % may differ.
singular_values = diag(S);
cumulative_energy = cumsum(singular_values.^2) / sum(singular_values.^2);
k_threshold = find(cumulative_energy >= threshold, 1);
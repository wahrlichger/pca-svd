
threshold_values = linspace(0.5, 0.9999, 50);
time_values = zeros(1, length(threshold_values));
memory_values = zeros(1, length(threshold_values));
mse_values = zeros(1, length(threshold_values));

for t = 1:length(threshold_values)
    threshold = threshold_values(t);
    k_threshold = find(cumulative_energy >= threshold, 1);
    
    tic;
    rank_k_approximation = U(:, 1:k_threshold) * S(1:k_threshold, 1:k_threshold) * V(:, 1:k_threshold)';
    compressed_image = uint8(rank_k_approximation);
    time_values(t) = toc;
    
    memory_values(t) = numel(U(:, 1:k_threshold)) * 8 + numel(S(1:k_threshold, 1:k_threshold)) * 8 + numel(V(:, 1:k_threshold)) * 8;
    mse_values(t) = mean((double(grayscale_image) - double(compressed_image)).^2, 'all');
end
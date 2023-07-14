function rank_k_approximation = compute_rank_k_approximation(U, S, V, k)
    rank_k_approximation = U(:, 1:k) * S(1:k, 1:k) * V(:, 1:k)';
end



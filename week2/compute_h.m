function H = compute_H(R,d)
    H = [R, d; zeros(1,3), 1];
end
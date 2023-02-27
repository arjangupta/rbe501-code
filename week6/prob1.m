clear; close all; clc;

syms r theta r_dot theta_dot

r_vec = [r*cos(theta); r*sin(theta)];

r_prime_vec = ...
[r_dot*cos(theta) - r*theta_dot*sin(theta);
 r_dot*sin(theta) - r*theta_dot*cos(theta)];

r_sq = dot(r_prime_vec, r_prime_vec);

simplify(r_sq)
clear; close all; clc;

syms r(t) theta(t)

r_vec = [r*cos(theta); r*sin(theta)];
r_dot = diff(r_vec,t);
r_sq = r_dot.'*r_dot;
latex(r_sq)
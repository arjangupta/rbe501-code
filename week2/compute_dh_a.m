function A = compute_A(alpha,theta,a,d)
    A = [cos(theta), -1*sin(theta)*cos(alpha), sin(theta)*sin(alpha), a*cos(theta); sin(theta), cos(theta)*cos(alpha), -1*cos(theta)*sin(alpha), a*sin(theta); 0, sin(alpha), cos(alpha), d; 0, 0, 0, 1];
end
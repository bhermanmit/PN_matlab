function [l,g,i] = matrix_to_indices(imat,nl,ng,ni)

    % compute indices
    l = mod(imat-1,nl) + 1;
    g = floor(mod(imat-1,nl*ng)/nl) + 1;
    i = floor(mod(imat-1,nl*ng*ni)/(nl*ng)) + 1;

end
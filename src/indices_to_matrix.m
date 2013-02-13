function imat = indices_to_matrix(l,g,i,nl,ng)

    % compute index
    imat = l + nl*(g - 1) + nl*ng*(i - 1);

end
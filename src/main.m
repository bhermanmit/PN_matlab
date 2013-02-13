% PN Matlab Solver

% read in njoy data
njoy = load('../data/njoy');

% read in input deck
input;

% construct loss matrix
M = loss_mat(inp,njoy);

% construct prod matrix
Q = prod_mat(inp,njoy);

% invert matrices
% phi = M\Q;
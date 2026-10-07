# Variables starting with x_ are reserved.
# Expect: error x_
V(x_1:) :- x_1 in [1];

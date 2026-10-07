# The same column twice in a head.
# Expect: error Column 'x' appears twice in the head of 'V'
V(x:, x:) :- x in [1];

# Arguments are named.
# Expect: error Positional arguments

Item(x:) :- x in [1, 2];
Total(x:) :- Item(x);

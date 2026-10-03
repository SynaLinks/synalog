# The Avg aggregate.
# Expect: rows Mean = [(2.5,)]
V(x:) :- x in [1, 2, 3, 4];
Mean(m? Avg= x) distinct :- V(x:);

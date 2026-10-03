# Max and Min aggregates.
# Expect: rows Range = [(1, 9)]
V(x:) :- x in [4, 1, 9, 7];
Range(lo? Min= x, hi? Max= x) distinct :- V(x:);

# Test: Max and Min aggregates. (from tests/programs/execution/03_max_min.l)

V(x:) :- x in [4, 1, 9, 7];
Range(lo? Min= x, hi? Max= x) distinct :- V(x:);

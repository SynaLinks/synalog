# Test: The least and greatest of booleans: false before true. (from tests/programs/combine4/min_max_of_booleans.l)

V(k: 1, b: true);
V(k: 1, b: false);
V(k: 2, b: true);
@OrderBy(Q, "k");
Q(k:, lo? Min= b, hi? Max= b) distinct :- V(k:, b:);

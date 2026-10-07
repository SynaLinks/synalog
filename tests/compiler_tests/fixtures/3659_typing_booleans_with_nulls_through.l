# Test: A boolean column with a null, passed on and tested. (from tests/programs/typing/booleans_with_nulls_through.l)

V(k: 1, b: null);
V(k: 2, b: true);
V(k: 3, b: false);
W(k:, b:) :- V(k:, b:);
Q(k:) :- W(k:, b:), b;

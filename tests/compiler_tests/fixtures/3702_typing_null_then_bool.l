# Test: A null first, a bool after: the column is a bool. (from tests/programs/typing/null_then_bool.l)

V(k: 1, v: null);
V(k: 2, v: true);
@OrderBy(Q, "k");
Q(k:, v:) :- V(k:, v:);

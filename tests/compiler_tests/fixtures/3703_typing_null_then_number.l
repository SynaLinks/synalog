# Test: A null first, a number after: the column is a number. (from tests/programs/typing/null_then_number.l)

V(k: 1, v: null);
V(k: 2, v: 5);
@OrderBy(Q, "k");
Q(k:, v:) :- V(k:, v:);

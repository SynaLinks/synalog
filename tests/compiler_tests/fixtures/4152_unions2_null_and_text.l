# Test: A null from one rule, texts from another. (from tests/programs/unions2/null_and_text.l)

U(k: 1, s: null);
U(k:, s:) :- k in [2, 3], s == (if k == 2 then "b" else "c");
@OrderBy(Q, "k");
Q(k:, s:) :- U(k:, s:);

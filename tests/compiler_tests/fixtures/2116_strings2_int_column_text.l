# Test: Integers of a column as text. (from tests/programs/strings2/int_column_text.l)

V(n: 3);
V(n: 12);
V(n: 100);
@OrderBy(Q, "n");
Q(n:, s: ToString(n)) :- V(n:);

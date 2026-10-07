# Test: @OrderBy on two columns, the second descending. (from tests/programs/execution/43_order_by_two_columns.l)

R(k: "b", v: 3);
R(k: "a", v: 1);
R(k: "a", v: 2);
@OrderBy(S, "k", "v DESC");
S(k:, v:) :- R(k:, v:);

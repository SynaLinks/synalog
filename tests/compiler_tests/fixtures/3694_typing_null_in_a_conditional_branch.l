# Test: A conditional whose branches are a null and a number. (from tests/programs/typing/null_in_a_conditional_branch.l)

V(k: 1);
V(k: 2);
@OrderBy(Q, "k");
Q(k:, v: (if k == 1 then null else k * 2)) :- V(k:);

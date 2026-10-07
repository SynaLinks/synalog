# Test: A conditional whose branches are a null and a text. (from tests/programs/typing/null_in_a_conditional_then_text.l)

V(k: 1);
V(k: 2);
@OrderBy(Q, "k");
Q(k:, v: (if k == 1 then null else "two")) :- V(k:);

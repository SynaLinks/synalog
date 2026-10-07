# Test: A conditional choosing an empty list or a list of text. (from tests/programs/lists3/empty_in_a_conditional.l)

V(k: 1);
V(k: 2);
@OrderBy(Q, "k");
Q(k:, n: Size(l)) :- V(k:), l == (if k == 1 then [] else ["a", "b"]);

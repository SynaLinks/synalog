# Test: Joining what a conditional chose. (from tests/programs/lists3/empty_in_a_conditional_joined.l)

V(k: 1);
V(k: 2);
@OrderBy(Q, "k");
Q(k:, s: Join((if k == 1 then [] else ["a", "b"]), ",")) :- V(k:);

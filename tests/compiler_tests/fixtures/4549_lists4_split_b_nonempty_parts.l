# Test: The parts that are not empty, splitting by 'b'. (from tests/programs/lists4/split_b_nonempty_parts.l)

T(k: 1, s: "a,b,c");
T(k: 2, s: "");
T(k: 3, s: "abc");
T(k: 4, s: ",,");
T(k: 5, s: "x,");
T(k: 6, s: null);
@OrderBy(Q, "k", "x");
Q(k:, x:) :- T(k:, s:), x in Split(s, "b"), x != "";

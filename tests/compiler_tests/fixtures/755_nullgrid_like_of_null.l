# Test: Like(s, "a%") of a null is null. (from tests/programs/nullgrid/like_of_null.l)

V(k: 1, s: null);
V(k: 2, s: "ab");
@OrderBy(N, "k");
N(k:, v: (if k == 1 then (if IsNull(Like(s, "a%")) then null else "bad") else "ok")) :- V(k:, s:);

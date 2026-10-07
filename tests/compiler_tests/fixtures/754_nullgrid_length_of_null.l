# Test: Length(s) of a null is null. (from tests/programs/nullgrid/length_of_null.l)

V(k: 1, s: null);
V(k: 2, s: "ab");
@OrderBy(N, "k");
N(k:, v: (if k == 1 then (if IsNull(Length(s)) then null else "bad") else "ok")) :- V(k:, s:);

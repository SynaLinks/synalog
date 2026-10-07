# Test: Rows whose clamped value is above 10. (from tests/programs/conditionals2/filter_on_conditional_10.l)

V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
@OrderBy(Q, "k");
Q(k:) :- V(k:, x:), (if x < 0 then 0 else if x > 10 then 10 else x) > 10;

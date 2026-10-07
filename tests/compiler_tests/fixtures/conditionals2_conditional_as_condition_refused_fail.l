# Test: A conditional alone is no condition: it is compared. (from tests/programs/conditionals2/conditional_as_condition_refused.l)
V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
Q(k:) :- V(k:, x:), (if x > 0 then true else false);

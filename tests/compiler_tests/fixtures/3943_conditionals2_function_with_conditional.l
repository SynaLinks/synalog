# Test: A function whose body is a conditional. (from tests/programs/conditionals2/function_with_conditional.l)

V(k: 1, x: 5, s: "a");
V(k: 2, x: -3, s: null);
V(k: 3, x: 0, s: "c");
V(k: 4, x: null, s: "d");
V(k: 5, x: 12, s: null);
V(k: 6, x: 7, s: "f");
Clip(v) = (if v is null then null else if v < 0 then 0 else v);
@OrderBy(Q, "k");
Q(k:, v: Clip(x)) :- V(k:, x:);

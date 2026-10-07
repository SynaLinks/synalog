# A statement cannot call a value function: Inc has no rows.
# Expect: valid
@Assert(V, inc: "∀ x, V x → x < 10");
Inc(x) = n :- n == x + 1;
V(x:) :- x in [1, 2];

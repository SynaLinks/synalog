# Test: A statement cannot call a value function: Inc has no rows. (from tests/programs/assertions/75_assertion_reads_a_value_function.l)

@Assert(V, inc: "∀ x, V x → x < 10");
Inc(x) = n :- n == x + 1;
V(x:) :- x in [1, 2];

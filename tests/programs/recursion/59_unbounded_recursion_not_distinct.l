# A recursion that is not distinct holds a multiset: over a cycle, every step
# adds copies of rows, so it never stops changing. Recursing until nothing
# changes (-1) is refused, rather than run forever.
# Expect: run-error R not distinct, so it cannot recurse until nothing changes
E(a: 1, b: 2);
E(a: 2, b: 1);
@Recursive(R, -1);
R(a:, b:) :- E(a:, b:);
R(a:, b: c) :- R(a:, b:), E(a: b, b: c);

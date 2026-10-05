# Test: @Limit on a recursion with an aggregate, computed until it converges. (from tests/programs/recursion/35_limit_of_an_aggregate_recursion.l)

E(a: 1, b: 2);
E(a: 2, b: 3);
E(a: 3, b: 4);
E(a: 4, b: 5);
@Recursive(D, -1);
@OrderBy(D, "n desc");
@Limit(D, 2);
D(n: 1, d? Min= 0) distinct;
D(n: b, d? Min= d + 1) distinct :- D(n: a, d:), E(a:, b:);

# Test: Two aggregates as rows of one predicate. (from tests/programs/unions/10_union_of_aggregates.l)

V(x:) :- x in [1, 2, 3];
Lo(m? Min= x) distinct :- V(x:);
Hi(m? Max= x) distinct :- V(x:);
@OrderBy(U, "k");
U(k: "min", v: m) :- Lo(m:);
U(k: "max", v: m) :- Hi(m:);

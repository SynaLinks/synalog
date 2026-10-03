# Test: A predicate may take the name of a built-in function: predicates and functions are separate namespaces, so Abs(x) in a value is still ABS. (from tests/programs/execution/79_predicate_named_like_a_function.l)

V(x:) :- x in [2, -3];
Abs(x:, a: 100) :- V(x:);
@OrderBy(Out, "x");
Out(x:, y:, z:) :- V(x:), y == Abs(x), Abs(x:, a: z);

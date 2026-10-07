# A predicate may take the name of a built-in function: predicates and
# functions are separate namespaces, so Abs(x) in a value is still ABS.
# Expect: rows Out = [(-3, 3, 100), (2, 2, 100)]
V(x:) :- x in [2, -3];
Abs(x:, a: 100) :- V(x:);
@OrderBy(Out, "x");
Out(x:, y:, z:) :- V(x:), y == Abs(x), Abs(x:, a: z);

# Test: Set operations (union, intersection, difference via negation)

# Two sets
SetA(x) :- x in [1, 2, 3, 4, 5];
SetB(x) :- x in [3, 4, 5, 6, 7];

# Union (via disjunction)
Union(x) :- SetA(x);
Union(x) :- SetB(x);

# Intersection (via conjunction)
Intersection(x) :- SetA(x), SetB(x);

# Difference A - B (via negation)
Difference(x) :- SetA(x), ~SetB(x);

# Symmetric difference
SymDiff(x) :- SetA(x), ~SetB(x);
SymDiff(x) :- SetB(x), ~SetA(x);

@OrderBy(Test, "x");
Test(x:) :- Intersection(x);

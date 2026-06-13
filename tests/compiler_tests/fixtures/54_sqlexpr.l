# Test: SqlExpr raw SQL escape hatch

Numbers(x) :- x in Range(5);

# Inject raw SQL with named variable substitution
@OrderBy(Boosted, "x");
Boosted(x:, boosted:) :-
  Numbers(x),
  boosted == SqlExpr("{x} * 100 + 1", {x: x});

@OrderBy(Test, "x");
Test(x:, boosted:) :- Boosted(x:, boosted:);

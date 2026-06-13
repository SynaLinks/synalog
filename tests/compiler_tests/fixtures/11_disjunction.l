# Test: Disjunction (OR in rules)

Number(x) :- x in Range(10);

# Disjunction in rule body
@OrderBy(Classification, "col0");
Classification(x, cat) :-
  Number(x),
  ((cat == "small", x < 3) | (cat == "medium", x >= 3, x < 7) | (cat == "large", x >= 7));

@OrderBy(Test, "col0");
Test(x, category) :- Classification(x, category);

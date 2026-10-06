# A function may not take a built-in function's name.
# Expect: error Reserved predicate name 'Round': it is a built-in function
Round(x) = Floor(x + 0.5);
Q(v: Round(2.5));

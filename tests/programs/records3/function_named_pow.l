# A function may not take a built-in function's name.
# Expect: error Reserved predicate name 'Pow': it is a built-in function
Pow(x) = {sq: x * x};
Q(v: Pow(3).sq);

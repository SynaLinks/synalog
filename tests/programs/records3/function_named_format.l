# A function may not take a built-in function's name.
# Expect: error Reserved predicate name 'Format': it is a built-in function
Format(s) = s;
Q(v: Format("a"));

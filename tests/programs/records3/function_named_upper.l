# A function may not take a built-in function's name.
# Expect: error Reserved predicate name 'Upper': it is a built-in function
Upper(s) = s ++ "!";
Q(v: Upper("a"));

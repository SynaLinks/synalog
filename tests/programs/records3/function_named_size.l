# A function may not take a built-in function's name.
# Expect: error Reserved predicate name 'Size': it is a built-in function
Size(l) = 0;
Q(v: Size([1]));

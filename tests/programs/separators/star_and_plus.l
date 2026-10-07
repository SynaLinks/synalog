# Characters special in patterns separate as themselves.
# Expect: rows Q = [(["a", "b"], ["x", "y"], ["p", "q"])]
Q(a: Split("a*b", "*"), b: Split("x+y", "+"), c: Split("p|q", "|"));

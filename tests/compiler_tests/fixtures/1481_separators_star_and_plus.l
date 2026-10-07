# Test: Characters special in patterns separate as themselves. (from tests/programs/separators/star_and_plus.l)

Q(a: Split("a*b", "*"), b: Split("x+y", "+"), c: Split("p|q", "|"));

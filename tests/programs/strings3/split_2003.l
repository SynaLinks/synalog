# 'a^b' split at '^', taken as text.
# Expect: rows Q = [(2, 'a', 'b')]
Q(n: Size(l), first: Element(l, 0), last: Element(l, Size(l) - 1)) :- l == Split("a^b", "^");

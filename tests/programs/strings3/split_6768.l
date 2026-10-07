# 'one--two' split at '--', taken as text.
# Expect: rows Q = [(2, 'one', 'two')]
Q(n: Size(l), first: Element(l, 0), last: Element(l, Size(l) - 1)) :- l == Split("one--two", "--");

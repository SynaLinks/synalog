# 'x||y||' split at '||', taken as text.
# Expect: rows Q = [(3, 'x', '')]
Q(n: Size(l), first: Element(l, 0), last: Element(l, Size(l) - 1)) :- l == Split("x||y||", "||");

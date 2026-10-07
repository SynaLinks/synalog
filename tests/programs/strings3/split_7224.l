# 'aaa' split at 'aa', taken as text.
# Expect: rows Q = [(2, '', 'a')]
Q(n: Size(l), first: Element(l, 0), last: Element(l, Size(l) - 1)) :- l == Split("aaa", "aa");

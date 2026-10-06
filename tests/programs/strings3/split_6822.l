# 'a+b+c' split at '+', taken as text.
# Expect: rows Q = [(3, 'a', 'c')]
Q(n: Size(l), first: Element(l, 0), last: Element(l, Size(l) - 1)) :- l == Split("a+b+c", "+");

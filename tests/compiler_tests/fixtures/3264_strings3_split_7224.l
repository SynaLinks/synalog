# Test: 'aaa' split at 'aa', taken as text. (from tests/programs/strings3/split_7224.l)

Q(n: Size(l), first: Element(l, 0), last: Element(l, Size(l) - 1)) :- l == Split("aaa", "aa");

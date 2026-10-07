# Test: 'a::b::c' split at '::', taken as text. (from tests/programs/strings3/split_7792.l)

Q(n: Size(l), first: Element(l, 0), last: Element(l, Size(l) - 1)) :- l == Split("a::b::c", "::");

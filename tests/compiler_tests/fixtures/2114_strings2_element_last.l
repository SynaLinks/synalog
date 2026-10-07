# Test: The last element. (from tests/programs/strings2/element_last.l)

Q(s: Element(l, Size(l) - 1)) :- l == Split("a,b,c", ",");

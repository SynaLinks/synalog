# Test: Numbers concatenated with an empty list. (from tests/programs/lists3/concat_numbers_then_empty.l)

Q(n: Size(c), first: Element(c, 0)) :- c == ArrayConcat([2, 3], []);

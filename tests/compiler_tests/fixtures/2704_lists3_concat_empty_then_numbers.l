# Test: An empty list concatenated with numbers. (from tests/programs/lists3/concat_empty_then_numbers.l)

Q(n: Size(c), last: Element(c, 1)) :- c == ArrayConcat([], [2, 3]);

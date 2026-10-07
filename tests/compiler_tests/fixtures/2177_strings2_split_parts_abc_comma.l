# Test: The parts of 'abc'. (from tests/programs/strings2/split_parts_abc_comma.l)

Q(part:) distinct :- part in Split("abc", ",");

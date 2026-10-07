# Test: The parts of ',a,'. (from tests/programs/strings2/split_parts_xax_comma.l)

@OrderBy(Q, "part");
Q(part:) distinct :- part in Split(",a,", ",");

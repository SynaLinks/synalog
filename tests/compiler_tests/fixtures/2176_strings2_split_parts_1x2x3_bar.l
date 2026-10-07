# Test: The parts of '1|2|3'. (from tests/programs/strings2/split_parts_1x2x3_bar.l)

@OrderBy(Q, "part");
Q(part:) distinct :- part in Split("1|2|3", "|");

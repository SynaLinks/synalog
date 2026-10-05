# Test: The parts of 'x.y.z'. (from tests/programs/strings2/split_parts_xxyxz_dot.l)

@OrderBy(Q, "part");
Q(part:) distinct :- part in Split("x.y.z", ".");

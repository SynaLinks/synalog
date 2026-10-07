# Test: The parts of 'a::b::c'. (from tests/programs/strings2/split_parts_axxbxxc_colons.l)

@OrderBy(Q, "part");
Q(part:) distinct :- part in Split("a::b::c", "::");

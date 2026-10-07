# Test: Splitting then joining 'a::b::c' gives it back. (from tests/programs/strings2/split_join_axxbxxc_colons.l)

Q(s: Join(Split("a::b::c", "::"), "::"));

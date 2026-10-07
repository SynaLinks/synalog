# Test: Splitting then joining 'x.y.z' gives it back. (from tests/programs/strings2/split_join_xxyxz_dot.l)

Q(s: Join(Split("x.y.z", "."), "."));

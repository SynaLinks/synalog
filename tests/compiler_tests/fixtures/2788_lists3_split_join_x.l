# Test: Split at commas, then joined again: the same text. (from tests/programs/lists3/split_join_x.l)

Q(n: Size(Split("x", ",")), s: Join(Split("x", ","), ","));

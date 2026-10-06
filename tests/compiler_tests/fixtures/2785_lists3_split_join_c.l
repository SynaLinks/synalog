# Test: Split at commas, then joined again: the same text. (from tests/programs/lists3/split_join_c.l)

Q(n: Size(Split(",", ",")), s: Join(Split(",", ","), ","));

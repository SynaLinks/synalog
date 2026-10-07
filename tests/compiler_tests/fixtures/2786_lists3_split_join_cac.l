# Test: Split at commas, then joined again: the same text. (from tests/programs/lists3/split_join_cac.l)

Q(n: Size(Split(",a,", ",")), s: Join(Split(",a,", ","), ","));

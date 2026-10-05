# Test: Splitting then joining '1|2|3' gives it back. (from tests/programs/strings2/split_join_1x2x3_bar.l)

Q(s: Join(Split("1|2|3", "|"), "|"));

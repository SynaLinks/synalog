# Test: The first and last strings of a group. (from tests/programs/strings/40_min_max_of_strings_per_group.l)

V(g: 1, s: "cat");
V(g: 1, s: "ant");
V(g: 1, s: "bee");
S(g:, lo? Min= s, hi? Max= s) distinct :- V(g:, s:);

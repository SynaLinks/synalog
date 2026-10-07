# Test: The parts of text 3 sorted. (from tests/programs/lists4/split_sorted_3.l)

T(k: 1, s: "a,b,c");
T(k: 2, s: "");
T(k: 3, s: "abc");
T(k: 4, s: ",,");
T(k: 5, s: "x,");
T(k: 6, s: null);
Q(a? Array= x -> x) distinct :- T(k: 3, s:), x in Split(s, ",");

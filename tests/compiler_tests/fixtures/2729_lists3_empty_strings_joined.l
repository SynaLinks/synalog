# Test: Joining lists of text, one empty, one null. (from tests/programs/lists3/empty_strings_joined.l)

S(k: 1, l: ["a", "b"]);
S(k: 2, l: []);
S(k: 3, l: null);
@OrderBy(Q, "k");
Q(k:, s: Join(l, "+")) :- S(k:, l:);

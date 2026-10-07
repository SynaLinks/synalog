# Test: Membership in lists of text, one empty, one null. (from tests/programs/lists3/empty_strings_member.l)

S(k: 1, l: ["a", "b"]);
S(k: 2, l: []);
S(k: 3, l: null);
Q(k:) :- S(k:, l:), "a" in l;

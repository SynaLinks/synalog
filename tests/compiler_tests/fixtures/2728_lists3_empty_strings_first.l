# Test: The first element, null for the empty and the null list. (from tests/programs/lists3/empty_strings_first.l)

S(k: 1, l: ["a", "b"]);
S(k: 2, l: []);
S(k: 3, l: null);
@OrderBy(Q, "k");
Q(k:, e: Element(l, 0)) :- S(k:, l:);

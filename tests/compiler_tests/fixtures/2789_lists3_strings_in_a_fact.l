# Test: A list of strings held by a fact, joined. (from tests/programs/lists3/strings_in_a_fact.l)

F(l: ["b", "a", "c"]);
Q(s: Join(l, "/")) :- F(l:);

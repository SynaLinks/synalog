# Test: An empty list joined is an empty text. (from tests/programs/lists4/join_of_empty_list.l)

E(l: []);
Q(v: Join(l, ",")) :- E(l:);

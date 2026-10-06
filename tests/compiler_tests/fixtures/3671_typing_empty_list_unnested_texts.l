# Test: Unnesting a column holding an empty list and a list of texts. (from tests/programs/typing/empty_list_unnested_texts.l)

V(l: []);
V(l: ["a", "b"]);
Q(n? += 1) distinct :- V(l:), x in l;

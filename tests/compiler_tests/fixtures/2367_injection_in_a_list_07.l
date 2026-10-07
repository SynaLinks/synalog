# Test: The string as a list element. (from tests/programs/injection/in_a_list_07.l)

Q(s:) :- s in ["a\", "other"], s != "other";

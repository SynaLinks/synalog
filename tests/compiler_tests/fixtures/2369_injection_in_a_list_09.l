# Test: The string as a list element. (from tests/programs/injection/in_a_list_09.l)

Q(s:) :- s in ["-- comment", "other"], s != "other";

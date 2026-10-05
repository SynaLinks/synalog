# Test: The string as a list element. (from tests/programs/injection/in_a_list_08.l)

Q(s:) :- s in ["/* comment */ x", "other"], s != "other";

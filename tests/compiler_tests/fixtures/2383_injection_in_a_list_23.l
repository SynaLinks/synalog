# Test: The string as a list element. (from tests/programs/injection/in_a_list_23.l)

Q(s:) :- s in ["0x27 OR 1", "other"], s != "other";

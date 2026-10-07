# Test: The string as a list element. (from tests/programs/injection/in_a_list_19.l)

Q(s:) :- s in ["%_\%", "other"], s != "other";

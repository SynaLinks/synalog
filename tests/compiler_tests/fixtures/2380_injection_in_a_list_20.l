# Test: The string as a list element. (from tests/programs/injection/in_a_list_20.l)

Q(s:) :- s in ["{x}; DROP", "other"], s != "other";

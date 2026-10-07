# Test: The string as a list element. (from tests/programs/injection/in_a_list_17.l)

Q(s:) :- s in ["''''", "other"], s != "other";

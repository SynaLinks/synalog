# Test: The string as a list element. (from tests/programs/injection/in_a_list_12.l)

Q(s:) :- s in ["E'\''", "other"], s != "other";

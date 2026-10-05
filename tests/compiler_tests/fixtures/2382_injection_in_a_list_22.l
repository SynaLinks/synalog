# Test: The string as a list element. (from tests/programs/injection/in_a_list_22.l)

Q(s:) :- s in ["’; DROP TABLE t; --", "other"], s != "other";

# Test: The string as a list element. (from tests/programs/injection/in_a_list_02.l)

Q(s:) :- s in ["x' OR '1'='1", "other"], s != "other";

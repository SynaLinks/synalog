# Test: The string as a list element. (from tests/programs/injection/in_a_list_18.l)

Q(s:) :- s in ["\x27; DROP TABLE t", "other"], s != "other";

# Test: The string as a list element. (from tests/programs/injection/in_a_list_10.l)

Q(s:) :- s in ["'; COMMIT; DROP TABLE t; --", "other"], s != "other";

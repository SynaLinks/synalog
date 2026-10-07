# Test: The string as a list element. (from tests/programs/injection/in_a_list_15.l)

Q(s:) :- s in ["');ATTACH DATABASE 'x' AS y;--", "other"], s != "other";

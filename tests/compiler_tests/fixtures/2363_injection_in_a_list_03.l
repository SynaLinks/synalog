# Test: The string as a list element. (from tests/programs/injection/in_a_list_03.l)

Q(s:) :- s in ["') UNION SELECT 1 --", "other"], s != "other";

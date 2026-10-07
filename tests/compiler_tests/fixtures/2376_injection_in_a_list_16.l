# Test: The string as a list element. (from tests/programs/injection/in_a_list_16.l)

Q(s:) :- s in ["' || (SELECT 1) || '", "other"], s != "other";

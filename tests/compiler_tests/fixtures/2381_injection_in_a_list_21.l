# Test: The string as a list element. (from tests/programs/injection/in_a_list_21.l)

Q(s:) :- s in ['a\tb', "other"], s != "other";

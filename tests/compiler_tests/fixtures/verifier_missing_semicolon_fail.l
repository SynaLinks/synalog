# Test: A statement without its ;. (from tests/programs/verifier/20_missing_semicolon.l)
Item(x:) :- x in [1, 2]
Total(x:) :- Item(x:);

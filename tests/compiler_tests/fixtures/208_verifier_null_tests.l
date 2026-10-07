# Test: is null / is not null. (from tests/programs/verifier/19_null_tests.l)

Row(x: 1, y: 2);
Unknown(x:) :- Row(x:, y:), y is null;
Known(x:) :- Row(x:, y:), y is not null;

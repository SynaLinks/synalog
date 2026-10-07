# Test: Negation matching on two columns. (from tests/programs/execution/59_negation_with_two_columns.l)

Want(a: 1, b: 2);
Want(a: 1, b: 3);
Have(a: 1, b: 3);
Missing(a:, b:) :- Want(a:, b:), ~Have(a:, b:);

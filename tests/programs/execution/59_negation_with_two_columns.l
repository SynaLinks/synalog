# Negation matching on two columns.
# Expect: rows Missing = [(1, 2)]
Want(a: 1, b: 2);
Want(a: 1, b: 3);
Have(a: 1, b: 3);
Missing(a:, b:) :- Want(a:, b:), ~Have(a:, b:);

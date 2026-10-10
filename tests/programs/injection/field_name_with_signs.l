# A quoted field name is a column name: parentheses, commas and colons are part of it.
# Expect: rows Q = [(1,)]
R(`Montant (EUR), net: TTC`: 1);
Q(x:) :- R(`Montant (EUR), net: TTC`: x);

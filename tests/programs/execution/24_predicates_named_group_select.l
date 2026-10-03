# Predicates named after SQL keywords, depending on each other.
# Expect: rows Select = [(1, 2)]
Group(g: 1, v: 2);
Table(g: 1);
Select(g:, v:) :- Group(g:, v:), Table(g:);

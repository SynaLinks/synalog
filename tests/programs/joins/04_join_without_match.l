# A join that matches nothing.
# Expect: rows J = []
A(id: 1);
B(id: 2);
J(id:) :- A(id:), B(id:);

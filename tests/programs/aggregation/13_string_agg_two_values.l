# StringAgg= joins the values with commas, in no particular order.
# Expect: rows A = [(2, 3)]
V(s: "a");
V(s: "b");
J(j? StringAgg= s) distinct :- V(s:);
A(parts: Size(Split(j, ",")), length: Length(j)) :- J(j:);

# A disjunction inside a negation does not compile: the verifier says so.
# Expect: error A disjunction inside a negation or a combine is not supported
V(x: 1);
Q(x:) :- V(x:), ~(V(x: 2) | V(x: 3));

# A disjunction inside a combine does not compile: the verifier says so.
# Expect: error A disjunction inside a negation or a combine is not supported
V(x: 1);
Q(t:) :- t == (combine += 1 :- V(x:), (x == 1 | x == 2));

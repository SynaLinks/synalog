# P negates itself inside an aggregating subquery: never stratified, as when
# it negates itself directly.
# Expect: error Negative recursion
@Recursive(P, 4);
P(x: 1);
P(x: 2) :- n == (combine += 1 :- ~P(x: 2)), n is not null;

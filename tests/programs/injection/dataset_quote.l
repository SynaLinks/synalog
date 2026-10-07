# @Dataset refuses a quote.
# Expect: error is not a schema name
@Dataset("x'y");
V(x: 1);
Q(x:) :- V(x:);

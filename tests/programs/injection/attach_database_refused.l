# @AttachDatabase is no directive: a program reads the database it runs on.
# Expect: error special predicates are allowed
@AttachDatabase(other, "/tmp/x.db");
V(x: 1);
Q(x:) :- V(x:);

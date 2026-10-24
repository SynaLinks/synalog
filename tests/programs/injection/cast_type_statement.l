# A Cast type name cannot end the statement: the compiler refuses it too, so
# compiling without verifying stays safe.
# Expect: error is not a type name
# Expect: compile-error Q is not a type name
Q(x:) :- x == Cast(1, "TEXT) AS x; DROP TABLE t; --");

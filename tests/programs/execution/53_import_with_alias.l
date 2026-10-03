# An imported predicate renamed with as.
# Expect: rows Out = [(1,), (2,)]
import lib.numbers.Numbers as N;
@OrderBy(Out, "x");
Out(x:) :- N(x:);

# Importing a file that does not exist.
# Expect: error lib/nothing.l
import lib.nothing.Thing;
Q(x:) :- Thing(x:);

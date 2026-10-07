# Importing a predicate the file does not define.
# Expect: error Ghost
import lib.shop.Ghost;
Q(x:) :- Ghost(x:);

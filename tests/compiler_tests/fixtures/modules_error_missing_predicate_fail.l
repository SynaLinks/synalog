# Test: Importing a predicate the file does not define. (from tests/programs/modules/error_missing_predicate.l)
import lib.shop.Ghost;
Q(x:) :- Ghost(x:);

# Test: Importing a file that does not exist. (from tests/programs/modules/error_missing_file.l)
import lib.nothing.Thing;
Q(x:) :- Thing(x:);

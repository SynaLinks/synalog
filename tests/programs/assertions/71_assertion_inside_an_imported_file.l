# An imported file's own assertion is checked, under the name its file gives the predicate.
# Expect: holds Small.bounded
import lib.checked.Small;
Use(x:) :- Small(x:);

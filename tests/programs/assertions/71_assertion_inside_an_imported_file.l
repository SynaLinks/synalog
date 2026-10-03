# An imported file's own assertion is checked, under the imported name.
# Expect: holds Checked_Small.bounded
import lib.checked.Small;
Use(x:) :- Small(x:);

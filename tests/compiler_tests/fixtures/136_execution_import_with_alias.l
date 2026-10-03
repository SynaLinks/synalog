# Test: An imported predicate renamed with as. (from tests/programs/execution/53_import_with_alias.l)

import lib.numbers.Numbers as N;
@OrderBy(Out, "x");
Out(x:) :- N(x:);

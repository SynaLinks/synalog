---
name: Numbers
description: Numbers from the library.
---
# Test: The front matter names an imported predicate: the file does not define it. (from tests/programs/front_matter/21_name_of_an_imported_predicate.l)
import lib.numbers.Numbers;
@OrderBy(Use, "x");
Use(x:) :- Numbers(x:);

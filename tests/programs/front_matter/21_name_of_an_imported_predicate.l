---
name: Numbers
description: Numbers from the library.
---
# The front matter names an imported predicate: the file does not define it.
# Expect: error Front matter names 'Numbers', which this file does not define
import lib.numbers.Numbers;
@OrderBy(Use, "x");
Use(x:) :- Numbers(x:);

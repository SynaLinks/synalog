---
name: Total
description: Totals: one per number.
---
# An unquoted ': ' is a YAML error.
# Expect: error Invalid front matter YAML

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];

---
name: Total
description: Totals: one per number.
---
# Test: An unquoted ': ' is a YAML error. (from tests/programs/front_matter/17_unquoted_colon_is_invalid_yaml.l)
@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];

# Test: A comment before the front matter: it is not front matter. (from tests/programs/front_matter/22_front_matter_after_a_comment.l)
---
name: Total
description: Three numbers.
---
@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];

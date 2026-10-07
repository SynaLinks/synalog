---
name: Total
description: Three numbers.
keywords: [sum, count]
locked: true
owner: finance
---
# keywords, locked, owner: the host's keys are accepted.
# Expect: valid

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];

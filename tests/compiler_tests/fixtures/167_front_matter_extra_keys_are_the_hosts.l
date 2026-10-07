---
name: Total
description: Three numbers.
keywords: [sum, count]
locked: true
owner: finance
---
# Test: keywords, locked, owner: the host's keys are accepted. (from tests/programs/front_matter/15_extra_keys_are_the_hosts.l)

@OrderBy(Total, "x");
Total(x:) :- x in [1, 2, 3];

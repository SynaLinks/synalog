# Test: Predicates named after SQL keywords, depending on each other. (from tests/programs/execution/24_predicates_named_group_select.l)

Group(g: 1, v: 2);
Table(g: 1);
Select(g:, v:) :- Group(g:, v:), Table(g:);

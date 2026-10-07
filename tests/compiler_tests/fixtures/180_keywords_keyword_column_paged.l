# Test: Paging through rows ordered by a keyword column. (from tests/programs/keywords/08_keyword_column_paged.l)

@OrderBy(R, "order");
R(order:) :- order in [2, 3, 1, 4];

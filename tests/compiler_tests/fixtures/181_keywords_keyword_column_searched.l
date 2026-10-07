# Test: search over a keyword column. (from tests/programs/keywords/09_keyword_column_searched.l)

@OrderBy(R, "group");
R(group:) :- group in ["a", "b"];

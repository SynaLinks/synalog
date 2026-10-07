# Test: distinct inside a name is part of the name. (from tests/programs/verifier/21_keyword_in_an_underscored_name.l)

@OrderBy(Count_distinct_items, "n");
Item(x:) :- x in [1, 1, 2];
Count_distinct_items(n? += 1) distinct :- Item(x:);

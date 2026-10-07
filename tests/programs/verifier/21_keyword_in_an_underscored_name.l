# distinct inside a name is part of the name.
# Expect: valid
# Expect: rows Count_distinct_items = [(3,)]

@OrderBy(Count_distinct_items, "n");
Item(x:) :- x in [1, 1, 2];
Count_distinct_items(n? += 1) distinct :- Item(x:);

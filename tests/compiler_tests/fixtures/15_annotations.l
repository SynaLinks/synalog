# Test: Annotations

Data(x) :- x in Range(20);

# OrderBy annotation
@OrderBy(Sorted, "col0");
Sorted(x) :- Data(x), x % 2 == 0;

# Limit annotation
@Limit(Top5, 5);
@OrderBy(Top5, "col0");
Top5(x) :- Data(x);

# Combined OrderBy and Limit
@OrderBy(TopEven, "col0");
@Limit(TopEven, 3);
TopEven(x) :- Data(x), x % 2 == 0;

# With annotation (forces materialization)
@With(Helper);
Helper(x, doubled) :- Data(x), x < 10, doubled == x * 2;

UsesHelper(x, doubled, tripled) :- Helper(x, doubled), tripled == doubled + x;

@OrderBy(Test, "col0", "col1");
Test("sorted", x) :- Sorted(x);
Test("top5", x) :- Top5(x);
Test("top_even", x) :- TopEven(x);

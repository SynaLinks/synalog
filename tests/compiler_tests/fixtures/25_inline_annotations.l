# Test: Limit and OrderBy annotations

Data(x) :- x in Range(20);

# Using @OrderBy and @Limit
@OrderBy(P1, "col0");
P1((x * 17) % 39) :- x in Range(10);

@Limit(P2, 5);
P2(x) :- Data(x);

@OrderBy(P3, "col0");
@Limit(P3, 3);
P3(x) :- Data(x), x % 2 == 0;

@OrderBy(Test, "col0", "col1");
Test("ordered", x) :- P1(x);
Test("limited", x) :- P2(x);
Test("both", x) :- P3(x);

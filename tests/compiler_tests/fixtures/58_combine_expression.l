# Test: combine inline aggregating expression (scalar/list subqueries in expressions)

Sales(region: "N", amount: 10);
Sales(region: "N", amount: 20);
Sales(region: "S", amount: 30);

# Inline combine as a scalar aggregate value
GrandTotal(total:) :- total == (combine += amount :- Sales(amount:));

# Inline combine collecting a list
AllAmounts(amounts:) :- amounts == (combine List= amount :- Sales(amount:));

@OrderBy(Test, "total");
Test(total:) :- GrandTotal(total:);

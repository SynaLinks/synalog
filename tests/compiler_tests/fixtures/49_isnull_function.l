# Test: IsNull() boolean function (distinct from the `is null` operator)

Data(id: 1, value: 10);
Data(id: 2, value: null);
Data(id: 3, value: 30);

# IsNull as a boolean expression in the head
@OrderBy(Flags, "id");
Flags(id:, missing: IsNull(value)) :- Data(id:, value:);

@OrderBy(Test, "id");
Test(id:, missing:) :- Flags(id:, missing:);

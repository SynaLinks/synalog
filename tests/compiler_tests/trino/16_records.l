# Test: Named fields (simplified records test)

# Data with named fields
Person(name: "Alice", age: 30);
Person(name: "Bob", age: 25);
Person(name: "Charlie", age: 35);

# Select specific fields
Names(name:) :- Person(name:, age:);

@OrderBy(Test, "name");
Test(name:) :- Names(name:);

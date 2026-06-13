# Test: Basic facts and simple rules

# Simple facts
Person("Alice");
Person("Bob");
Person("Charlie");

# Facts with multiple columns
Employee(name: "Alice", department: "Engineering", salary: 75000);
Employee(name: "Bob", department: "Marketing", salary: 65000);
Employee(name: "Charlie", department: "Engineering", salary: 80000);

# Simple rule
EngineeringEmployee(name:) :- Employee(name:, department: "Engineering", salary:);

@OrderBy(Test, "name");
Test(name:) :- EngineeringEmployee(name:);

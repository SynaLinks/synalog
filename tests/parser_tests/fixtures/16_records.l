# Test: Records/Structs
@Engine("duckdb");

# Simple record
Person(info: {name: "Alice", age: 30});
Person(info: {name: "Bob", age: 25});

# Nested records
Employee(data: {person: {name: "Charlie", age: 35}, department: "Engineering"});
Employee(data: {person: {name: "Diana", age: 28}, department: "Marketing"});

# Record field access
PersonName(name: info.name) :- Person(info:);

# Nested record field access
EmployeeInfo(name: data.person.name, dept: data.department) :- Employee(data:);

# Record construction in rules
Combined(record: {x: a, y: b, sum: a + b}) :- a in [1, 2], b in [3, 4];

@OrderBy(Test, "name");
Test(name:) :- PersonName(name:);

# run: EngineeringTeam
@Engine("duckdb");

# Tables
Employee(name: "Alice", department: "Engineering", salary: 75000);
Employee(name: "Bob", department: "Marketing", salary: 65000);
Employee(name: "Charlie", department: "Engineering", salary: 80000);

# Rules
@OrderBy(EngineeringTeam, "name");
EngineeringTeam(name:, salary:) :- Employee(name:, department: "Engineering", salary:);

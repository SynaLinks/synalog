# Test: Union of multiple rules
@Engine("duckdb");

Students(name: "Alice", grade: 85);
Students(name: "Bob", grade: 72);
Teachers(name: "Prof Smith", department: "Math");
Teachers(name: "Prof Jones", department: "Science");

# Union: all people (students and teachers)
People(name:, role: "student") :- Students(name:, grade:);
People(name:, role: "teacher") :- Teachers(name:, department:);

@OrderBy(Test, "name");
Test(name:, role:) :- People(name:, role:);

# Test: Array aggregations
@Engine("duckdb");

Team(name: "Alice", skill: "Python");
Team(name: "Alice", skill: "SQL");
Team(name: "Bob", skill: "Java");
Team(name: "Bob", skill: "Python");
Team(name: "Bob", skill: "Go");

# Array aggregation with sorting key
SkillsByPerson(name:, skills? Array= skill -> skill) distinct :- Team(name:, skill:);

@OrderBy(Test, "name");
Test(name:, skills:) :- SkillsByPerson(name:, skills:);

# Test: Complex join patterns
@Engine("duckdb");

# Tables for joins
Users(id: 1, name: "Alice", dept: 101);
Users(id: 2, name: "Bob", dept: 102);
Users(id: 3, name: "Charlie", dept: 101);

Departments(id: 101, name: "Engineering");
Departments(id: 102, name: "Marketing");
Departments(id: 103, name: "Sales");

Projects(id: 1, name: "Alpha", lead: 1);
Projects(id: 2, name: "Beta", lead: 2);
Projects(id: 3, name: "Gamma", lead: 1);

Assignments(user_id: 1, project_id: 1);
Assignments(user_id: 1, project_id: 2);
Assignments(user_id: 2, project_id: 2);
Assignments(user_id: 3, project_id: 3);

# Two-way join
UserDept(user_name:, dept_name:) :-
  Users(id:, name: user_name, dept: dept_id),
  Departments(id: dept_id, name: dept_name);

# Three-way join
UserProjects(user_name:, project_name:, dept_name:) :-
  Users(id: uid, name: user_name, dept: dept_id),
  Assignments(user_id: uid, project_id: pid),
  Projects(id: pid, name: project_name, lead:),
  Departments(id: dept_id, name: dept_name);

# Self-join (find users in same department)
Colleagues(user1:, user2:) :-
  Users(id: id1, name: user1, dept: d),
  Users(id: id2, name: user2, dept: d),
  id1 < id2;

# Triangle join (user leads project they are assigned to)
LeadsOwn(user_name:, project_name:) :-
  Users(id: uid, name: user_name, dept:),
  Projects(id: pid, name: project_name, lead: uid),
  Assignments(user_id: uid, project_id: pid);

@OrderBy(Test, "user_name");
Test(user_name:, dept_name:) :- UserDept(user_name:, dept_name:);

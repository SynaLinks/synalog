# Knowledge graph: entity concepts (nodes) + relationship concepts (edges),
# then rules that traverse. Self-contained — no --load needed (run validates first):
#   synalog knowledge_graph.l run TeamMate

@Engine("duckdb");

# Source facts (stand in for an external table).
Employees(person_id: 1, name: "Alice", department_id: 10);
Employees(person_id: 2, name: "Bob",   department_id: 10);
Employees(person_id: 3, name: "Carol", department_id: 20);
Departments(department_id: 10, name: "Engineering");
Departments(department_id: 20, name: "Marketing");

# Nodes — first column is the primary key, sorted by id.
@OrderBy(Person, "person_id");
Person(person_id:, name:) distinct :- Employees(person_id:, name:);

@OrderBy(Department, "department_id");
Department(department_id:, name:) distinct :- Departments(department_id:, name:);

# Edge — joins through the node concepts, not the raw table, so a node
# filter automatically applies to the edge (referential integrity).
@OrderBy(WorksIn, "person_id");
WorksIn(person_id:, department_id:) distinct :-
  Person(person_id:),
  Department(department_id:),
  Employees(person_id:, department_id:);

# Traversal — two people in the same department, named for readability.
@OrderBy(TeamMate, "person_name");
TeamMate(person_name:, mate_name:, department:) distinct :-
  WorksIn(person_id:, department_id:),
  WorksIn(person_id: mate_id, department_id:),
  person_id != mate_id,
  Person(person_id:, name: person_name),
  Person(person_id: mate_id, name: mate_name),
  Department(department_id:, name: department);

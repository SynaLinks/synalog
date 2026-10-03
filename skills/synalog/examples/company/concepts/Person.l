---
name: Person
description: Every person of the company (a node of the graph).
---
import tables.Employees.Employees;

# A node: its first column is its key, and it is ordered by it.
@OrderBy(Person, "person_id");
Person(person_id:, name:) distinct :- Employees(person_id:, name:);

---
name: WorksIn
description: Which department each person works in (an edge of the graph).
---
import concepts.department.Department;
import concepts.person.Person;
import tables.employees.Employees;

# An edge joins through the node concepts, not the raw table, so a filter on a
# node applies to its edges too.
@OrderBy(WorksIn, "person_id");
WorksIn(person_id:, department_id:) distinct :-
  Person(person_id:),
  Department(department_id:),
  Employees(person_id:, department_id:);

---
name: Employees
description: One row per employee, with their name and department.
---
@OrderBy(Employees, "person_id");
Employees(person_id:, name:, department_id:) :- employees(person_id:, name:, department_id:);

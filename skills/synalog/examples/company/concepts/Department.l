---
name: Department
description: Every department of the company (a node of the graph).
---
import tables.Departments.Departments;

@OrderBy(Department, "department_id");
Department(department_id:, name:) distinct :- Departments(department_id:, name:);

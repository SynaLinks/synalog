---
name: Departments
description: One row per department, with its name.
---
@OrderBy(Departments, "department_id");
Departments(department_id:, name:) :- departments(department_id:, name:);

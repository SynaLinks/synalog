---
name: Employees
description: One row per employee, with the manager they report to directly (0 for the CEO).
---
@OrderBy(Employees, "employee_id");
Employees(employee_id:, manager_id:) :- employees(employee_id:, manager_id:);

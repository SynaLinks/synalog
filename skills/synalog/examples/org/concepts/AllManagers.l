---
name: AllManagers
description: Every manager of each employee, directly or up the chain.
keywords: [reporting line, hierarchy, chain of command]
---
import tables.Employees.Employees;

# Direct managers (base case) plus every manager up the chain (recursive case);
# @Recursive bounds the path length, so a cycle in the data terminates.
@OrderBy(AllManagers, "employee_id");
@Recursive(AllManagers, 20);
AllManagers(employee_id:, manager_id:) distinct :-
  Employees(employee_id:, manager_id:),
  manager_id != 0;
AllManagers(employee_id:, manager_id:) distinct :-
  AllManagers(employee_id:, manager_id: intermediate),
  Employees(employee_id: intermediate, manager_id:),
  manager_id != 0;

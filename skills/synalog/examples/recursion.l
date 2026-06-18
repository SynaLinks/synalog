# Recursion: transitive closure over an org chart. Base case + recursive
# case, with @Recursive bounding the path length so cycles terminate.
# Self-contained — no --load needed (run validates the program first):
#   synalog recursion.l run AllManagers

@Engine("duckdb");

# Each employee reports directly to one manager.
Employees(employee_id: 1, manager_id: 0);   # 0 = no manager (the CEO)
Employees(employee_id: 2, manager_id: 1);
Employees(employee_id: 3, manager_id: 2);
Employees(employee_id: 4, manager_id: 2);

# Direct reports (base case) plus every manager up the chain (recursive case).
@OrderBy(AllManagers, "employee_id");
@Recursive(AllManagers, 20);
AllManagers(employee_id:, manager_id:) distinct :-
  Employees(employee_id:, manager_id:),
  manager_id != 0;
AllManagers(employee_id:, manager_id:) distinct :-
  AllManagers(employee_id:, manager_id: intermediate),
  Employees(employee_id: intermediate, manager_id:),
  manager_id != 0;

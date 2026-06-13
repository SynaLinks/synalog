# Test: Self join with multiple conditions
@Engine("duckdb");

Employee(id: 1, name: "Alice", manager_id: 3);
Employee(id: 2, name: "Bob", manager_id: 3);
Employee(id: 3, name: "Charlie", manager_id: 4);
Employee(id: 4, name: "David", manager_id: 4);

# Self join to find employee-manager pairs
@OrderBy(ManagerPairs, "employee");
ManagerPairs(employee: e_name, manager: m_name) :-
  Employee(id: e_id, name: e_name, manager_id: m_id),
  Employee(id: m_id, name: m_name, manager_id:);

@OrderBy(Test, "employee");
Test(employee:, manager:) :- ManagerPairs(employee:, manager:);

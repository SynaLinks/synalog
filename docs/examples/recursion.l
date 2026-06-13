# run: AllManagers, ShippingCost
@Engine("duckdb");

# Tables
Employees(employee_id: 1, manager_id: null);
Employees(employee_id: 2, manager_id: 1);
Employees(employee_id: 3, manager_id: 2);
Employees(employee_id: 4, manager_id: 2);

ShippingRoutes(origin: "warehouse_main", destination: "rotterdam", cost: 4);
ShippingRoutes(origin: "rotterdam", destination: "oslo", cost: 3);
ShippingRoutes(origin: "warehouse_main", destination: "oslo", cost: 9);
ShippingRoutes(origin: "oslo", destination: "helsinki", cost: 2);

# Rules

## Transitive closure: every manager above an employee, at any depth.
@Recursive(AllManagers, 20);
@OrderBy(AllManagers, "employee_id", "manager_id");
AllManagers(employee_id:, manager_id:) :-
  Employees(employee_id:, manager_id:), manager_id is not null;
AllManagers(employee_id:, manager_id:) :-
  AllManagers(employee_id:, manager_id: intermediate),
  Employees(employee_id: intermediate, manager_id:), manager_id is not null;

## Shortest paths: enumerate route costs recursively...
@Recursive(RouteCost, 10);
RouteCost(destination:, cost:) :-
  ShippingRoutes(origin: "warehouse_main", destination:, cost:);
RouteCost(destination:, cost: total) :-
  RouteCost(destination: hub, cost: hub_cost),
  ShippingRoutes(origin: hub, destination:, cost:),
  total == hub_cost + cost;

## ...then keep the cheapest per destination.
@OrderBy(ShippingCost, "destination");
ShippingCost(destination:, total? Min= cost) distinct :- RouteCost(destination:, cost:);

# Test: Complex negation patterns

# Data
Users(1, "Alice", "admin");
Users(2, "Bob", "user");
Users(3, "Charlie", "user");
Users(4, "Diana", "guest");

Orders(1, 100);
Orders(1, 200);
Orders(2, 50);

Reviews(2, 5);
Reviews(3, 4);

# Simple negation
UsersWithoutOrders(id, name) :-
  Users(id, name, role),
  ~Orders(id, _);

# Negation with specific value
NonAdmins(id, name) :-
  Users(id, name, role),
  ~(role == "admin");

# Double negation (equivalent to positive)
ActiveUsers(id, name) :-
  Users(id, name, role),
  ~(~Orders(id, _));

# Negation with conjunction inside
UsersWithoutLargeOrders(id, name) :-
  Users(id, name, role),
  ~(Orders(id, amount), amount > 150);

# Multiple negations
QuietUsers(id, name) :-
  Users(id, name, role),
  ~Orders(id, _),
  ~Reviews(id, _);

@OrderBy(Test, "id");
Test(id:, name:) :- UsersWithoutOrders(id, name);

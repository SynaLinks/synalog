# Without the functor, the default filter keeps every customer.
# Expect: rows CustomerRevenue = [("John", 30), ("Mary", 5)]
Orders(customer_name: "John", amount: 10);
Orders(customer_name: "John", amount: 20);
Orders(customer_name: "Mary", amount: 5);
@OrderBy(CustomerRevenue, "customer_name");
CustomerRevenue(customer_name:, revenue? += amount) distinct :-
  Filter(customer_name:), Orders(customer_name:, amount:);
Filter(customer_name:) distinct :- Orders(customer_name:);

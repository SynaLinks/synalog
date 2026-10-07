# Test: Without the functor, the default filter keeps every customer. (from tests/programs/functors/04_default_filter.l)

Orders(customer_name: "John", amount: 10);
Orders(customer_name: "John", amount: 20);
Orders(customer_name: "Mary", amount: 5);
Filter(customer_name:) distinct :- Orders(customer_name:);
@OrderBy(CustomerRevenue, "customer_name");
CustomerRevenue(customer_name:, revenue? += amount) distinct :-
  Filter(customer_name:), Orders(customer_name:, amount:);

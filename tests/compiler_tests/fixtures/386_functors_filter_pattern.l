# Test: The filter pattern: a default filter, specialized by a functor. (from tests/programs/functors/03_filter_pattern.l)

Orders(customer_name: "John", amount: 10);
Orders(customer_name: "John", amount: 20);
Orders(customer_name: "Mary", amount: 5);
@OrderBy(CustomerRevenue, "customer_name");
CustomerRevenue(customer_name:, revenue? += amount) distinct :-
  Filter(customer_name:), Orders(customer_name:, amount:);
Filter(customer_name:) distinct :- Orders(customer_name:);
JohnFilter(customer_name: "John");
JohnsRevenue := CustomerRevenue(Filter: JohnFilter);

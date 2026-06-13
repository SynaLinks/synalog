# run: CustomerRevenue, JohnsRevenue, EnterpriseRevenue, SMBRevenue
@Engine("duckdb");

# Tables
Orders(customer_name: "John", user_id: 1, amount: 100);
Orders(customer_name: "John", user_id: 1, amount: 250);
Orders(customer_name: "Mary", user_id: 2, amount: 4000);
Orders(customer_name: "Acme", user_id: 3, amount: 12000);

EnterpriseCustomers(segment_id: "enterprise", user_id: 3);
SMBCustomers(segment_id: "smb", user_id: 1);
SMBCustomers(segment_id: "smb", user_id: 2);

# Rules

## The filter pattern: a generic rule with a Filter dependency.
@OrderBy(CustomerRevenue, "customer_name");
CustomerRevenue(customer_name:, revenue? += amount) distinct :-
  Filter(customer_name:), Orders(customer_name:, amount:);

## Default filter = all rows.
Filter(customer_name:) distinct :- Orders(customer_name:);

## Specialized filter, applied with a functor.
JohnFilter(customer_name: "John");
JohnsRevenue := CustomerRevenue(Filter: JohnFilter);

## A reusable revenue pattern, parameterized by segment.
@OrderBy(SegmentRevenue, "segment_id");
SegmentRevenue(segment_id:, total? += amount) distinct :-
  Segment(segment_id:, user_id:),
  Orders(user_id:, amount:);

Segment(segment_id:, user_id:) :- EnterpriseCustomers(segment_id:, user_id:);

EnterpriseRevenue := SegmentRevenue(Segment: EnterpriseCustomers);
SMBRevenue := SegmentRevenue(Segment: SMBCustomers);

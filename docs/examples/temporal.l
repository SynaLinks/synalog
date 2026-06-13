# run: MonthlyOrders, JanuaryOrders, OrderHours, ActiveSubscriptions
@Engine("duckdb");

# Tables
Orders(order_id: 1, created_at: "2024-01-15 10:30:00");
Orders(order_id: 2, created_at: "2024-01-28 18:05:00");
Orders(order_id: 3, created_at: "2024-02-03 09:00:00");
Orders(order_id: 4, created_at: "2024-02-14 22:45:00");
Orders(order_id: 5, created_at: "2024-03-01 08:15:00");

Subscriptions(sub_id: 1, expires: "2024-06-30");
Subscriptions(sub_id: 2, expires: "2030-06-30");

# Rules

## The pipeline: ToString -> Substr -> (ToInt64 if needed).
@OrderBy(MonthlyOrders, "month");
MonthlyOrders(month:, count? += 1) distinct :-
  Orders(created_at:),
  month == Substr(ToString(created_at), 1, 7);

## ISO strings compare correctly: date-range filters are plain comparisons.
@OrderBy(JanuaryOrders, "order_id");
JanuaryOrders(order_id:) :-
  Orders(order_id:, created_at:),
  ToString(created_at) >= "2024-01-01",
  ToString(created_at) < "2024-02-01";

## Extract parts as integers for arithmetic.
@OrderBy(OrderHours, "order_id");
OrderHours(order_id:, hour:, is_evening:) :-
  Orders(order_id:, created_at:),
  hour == ToInt64(Substr(ToString(created_at), 12, 2)),
  is_evening == (if hour >= 18 then "yes" else "no");

## "Today"-relative logic with the CurrentDate built-in concept.
@OrderBy(ActiveSubscriptions, "sub_id");
ActiveSubscriptions(sub_id:, expires:) :-
  Subscriptions(sub_id:, expires:),
  CurrentDate(date:),
  expires >= date;

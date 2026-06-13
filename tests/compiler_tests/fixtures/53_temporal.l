# Test: Temporal data pipeline (timestamp -> string -> parts)

Orders(id: 1, created_at: "2024-01-15 10:30:00");
Orders(id: 2, created_at: "2024-01-20 14:00:00");
Orders(id: 3, created_at: "2024-02-05 09:15:00");

# Year-month extraction and grouping
@OrderBy(MonthlyCount, "month");
MonthlyCount(month:, count? += 1) distinct :-
  Orders(id:, created_at:),
  month == Substr(ToString(created_at), 1, 7);

# Hour extracted as an integer
@OrderBy(OrderHour, "id");
OrderHour(id:, hour:) :-
  Orders(id:, created_at:),
  hour == ToInt64(Substr(ToString(created_at), 12, 2));

@OrderBy(Test, "month");
Test(month:, count:) :- MonthlyCount(month:, count:);

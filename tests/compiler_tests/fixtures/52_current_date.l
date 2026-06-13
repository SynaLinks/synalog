# Test: CurrentDate built-in concept

Events(id: 1, created: "2026-05-26");
Events(id: 2, created: "2025-01-01");

# Keep events whose year matches the current year
@OrderBy(ThisYear, "id");
ThisYear(id:) :-
  Events(id:, created:),
  CurrentDate(date: today),
  Substr(created, 1, 4) == Substr(today, 1, 4);

@OrderBy(Test, "id");
Test(id:) :- ThisYear(id:);

---
name: RunsPerDay
description: Number of smoke test runs per calendar day.
---
import tables.smoke_tests.SmokeTests;

# Temporal columns go through ToString -> Substr.
@OrderBy(RunsPerDay, "day");
RunsPerDay(day:, runs? += 1) distinct :-
  SmokeTests(run_at:), day == Substr(ToString(run_at), 1, 10);

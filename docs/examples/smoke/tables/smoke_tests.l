---
name: SmokeTests
description: One row per smoke test run, with its device, status, duration and time.
---
@OrderBy(SmokeTests, "test_id");
SmokeTests(test_id:, device:, status:, duration_ms:, run_at:) :-
  smoke_tests(test_id:, device:, status:, duration_ms:, run_at:);

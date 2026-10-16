---
name: TestStatus
description: The statuses a smoke test run can end with (passed, failed, ...).
---
import tables.smoke_tests.SmokeTests;

@OrderBy(TestStatus, "status");
TestStatus(status:) distinct :- SmokeTests(status:);

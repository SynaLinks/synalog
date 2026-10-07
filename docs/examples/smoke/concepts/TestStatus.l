---
name: TestStatus
description: The statuses a smoke test run can end with (passed, failed, ...).
---
import tables.SmokeTests.SmokeTests;

@OrderBy(TestStatus, "status");
TestStatus(status:) distinct :- SmokeTests(status:);

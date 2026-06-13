# run: TestStatus, FailuresByDevice, RunsPerDay
# load: smoke_tests.csv as smoke_tests
@Engine("duckdb");

# Tables

## Smoke test runs loaded from smoke_tests.csv.
SmokeTests(test_id:, device:, status:, duration_ms:, run_at:) :-
  smoke_tests(test_id:, device:, status:, duration_ms:, run_at:);

# Concepts

@OrderBy(DeviceNode, "device");
DeviceNode(device:) distinct :- SmokeTests(device:);

@OrderBy(TestStatus, "status");
TestStatus(status:) distinct :- SmokeTests(status:);

# Rules

## Number of failed smoke tests per device.
@OrderBy(FailuresByDevice, "failures DESC");
FailuresByDevice(device:, failures? += 1) distinct :-
  DeviceNode(device:), SmokeTests(device:, status: "failed");

## Smoke test runs per calendar day.
@OrderBy(RunsPerDay, "day");
RunsPerDay(day:, runs? += 1) distinct :-
  SmokeTests(run_at:), day == Substr(ToString(run_at), 1, 10);

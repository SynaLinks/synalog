---
name: FailuresByDevice
description: Number of failed smoke tests per device, most failures first.
keywords: [failures, errors, broken devices]
---
import concepts.Device.Device;
import tables.SmokeTests.SmokeTests;

@OrderBy(FailuresByDevice, "failures DESC");
FailuresByDevice(device:, failures? += 1) distinct :-
  Device(device:), SmokeTests(device:, status: "failed");

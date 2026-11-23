---
name: Device
description: The devices smoke tests run on.
---
import tables.smoke_tests.SmokeTests;

@OrderBy(Device, "device");
Device(device:) distinct :- SmokeTests(device:);

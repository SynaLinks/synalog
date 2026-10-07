---
name: Device
description: The devices smoke tests run on.
---
import tables.SmokeTests.SmokeTests;

@OrderBy(Device, "device");
Device(device:) distinct :- SmokeTests(device:);

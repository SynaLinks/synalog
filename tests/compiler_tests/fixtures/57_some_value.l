# Test: 1= representative-value aggregator

Readings(sensor: "s1", unit: "C", value: 20);
Readings(sensor: "s1", unit: "C", value: 22);
Readings(sensor: "s2", unit: "F", value: 70);

@OrderBy(SensorUnit, "sensor");
SensorUnit(sensor:, unit? 1= unit, total? += value) distinct :- Readings(sensor:, unit:, value:);

@OrderBy(Test, "sensor");
Test(sensor:, unit:, total:) :- SensorUnit(sensor:, unit:, total:);

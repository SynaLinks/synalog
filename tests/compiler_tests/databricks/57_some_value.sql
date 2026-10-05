WITH t_1_Readings AS (SELECT * FROM VALUES
  ("s1", "C", 20),
  ("s1", "C", 22),
  ("s2", "F", 70)
AS UNUSED_TABLE_NAME(sensor, unit, value)),
t_0_SensorUnit AS (SELECT
  Readings.sensor AS sensor,
  MIN(Readings.unit) AS unit,
  SUM(Readings.value) AS total
FROM
  t_1_Readings AS Readings
GROUP BY 1 ORDER BY sensor NULLS LAST)
SELECT
  SensorUnit.sensor AS sensor,
  SensorUnit.unit AS unit,
  SensorUnit.total AS total
FROM
  t_0_SensorUnit AS SensorUnit ORDER BY sensor NULLS LAST;
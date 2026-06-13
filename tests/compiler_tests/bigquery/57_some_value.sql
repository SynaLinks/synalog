WITH t_1_Readings AS (SELECT * FROM (
  
    SELECT
      "s1" AS sensor,
      "C" AS unit,
      20 AS value
   UNION ALL
  
    SELECT
      "s1" AS sensor,
      "C" AS unit,
      22 AS value
   UNION ALL
  
    SELECT
      "s2" AS sensor,
      "F" AS unit,
      70 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_0_SensorUnit AS (SELECT
  Readings.sensor AS sensor,
  MIN(Readings.unit) AS unit,
  SUM(Readings.value) AS total
FROM
  t_1_Readings AS Readings
GROUP BY sensor ORDER BY sensor)
SELECT
  SensorUnit.sensor AS sensor,
  SensorUnit.unit AS unit,
  SensorUnit.total AS total
FROM
  t_0_SensorUnit AS SensorUnit ORDER BY sensor;
-- Initializing DuckDB environment.
create schema if not exists synalog_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists synalogrecord893574736 cascade; create type synalogrecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;


-- Synalog type: synalogrecord481217614
drop type if exists synalogrecord481217614 cascade; create type synalogrecord481217614 as struct(r synalogrecord893574736);

-- Synalog type: synalogrecord383307722
drop type if exists synalogrecord383307722 cascade; create type synalogrecord383307722 as struct(a timestamp);

-- Synalog type: synalogrecord519939597
drop type if exists synalogrecord519939597 cascade; create type synalogrecord519939597 as struct(args text[], predicate text);
WITH t_1_Readings AS (SELECT * FROM (
  
    SELECT
      's1' AS sensor,
      'C' AS unit,
      20 AS value
   UNION ALL
  
    SELECT
      's1' AS sensor,
      'C' AS unit,
      22 AS value
   UNION ALL
  
    SELECT
      's2' AS sensor,
      'F' AS unit,
      70 AS value
  
) AS UNUSED_TABLE_NAME  ),
t_0_SensorUnit AS (SELECT
  Readings.sensor AS sensor,
  MIN(Readings.unit) AS unit,
  SUM(Readings.value) AS total
FROM
  t_1_Readings AS Readings
GROUP BY Readings.sensor ORDER BY sensor)
SELECT
  SensorUnit.sensor AS sensor,
  SensorUnit.unit AS unit,
  SensorUnit.total AS total
FROM
  t_0_SensorUnit AS SensorUnit ORDER BY sensor;
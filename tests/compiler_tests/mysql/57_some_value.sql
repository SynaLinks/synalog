-- Compiled by SynaLog — logic programming for AI agents (https://github.com/synalinks/synalog).
-- Copyright 2025-2026 Yoan Sallami (Synalinks Team).
-- SPDX-License-Identifier: Apache-2.0

-- Initializing MySQL environment.
SET SESSION sql_mode = 'ANSI_QUOTES,PIPES_AS_CONCAT,NO_BACKSLASH_ESCAPES';
SET SESSION optimizer_switch = 'derived_condition_pushdown=off';
SET NAMES utf8mb4 COLLATE utf8mb4_0900_bin;
SET SESSION group_concat_max_len = 1073741824;

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
t_0_SensorUnit AS (SELECT * FROM (
SELECT
  Readings.sensor AS sensor,
  MIN(Readings.unit) AS unit,
  SUM(Readings.value) AS total
FROM
  t_1_Readings AS Readings
GROUP BY 1
) AS UNUSED_TABLE_NAME ORDER BY sensor IS NULL, sensor)
SELECT * FROM (
SELECT
  SensorUnit.sensor AS sensor,
  SensorUnit.unit AS unit,
  SensorUnit.total AS total
FROM
  t_0_SensorUnit AS SensorUnit
) AS UNUSED_TABLE_NAME ORDER BY sensor IS NULL, sensor;
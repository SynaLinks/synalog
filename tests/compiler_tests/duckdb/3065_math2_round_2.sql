-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      7 AS x
   UNION ALL
  
    SELECT
      2 AS id,
      -7 AS x
   UNION ALL
  
    SELECT
      3 AS id,
      2.5E0 AS x
   UNION ALL
  
    SELECT
      4 AS id,
      -2.5E0 AS x
   UNION ALL
  
    SELECT
      5 AS id,
      0 AS x
   UNION ALL
  
    SELECT
      6 AS id,
      3 AS x
   UNION ALL
  
    SELECT
      7 AS id,
      0.125E0 AS x
   UNION ALL
  
    SELECT
      8 AS id,
      1000000 AS x
   UNION ALL
  
    SELECT
      9 AS id,
      -0.75E0 AS x
   UNION ALL
  
    SELECT
      10 AS id,
      12.345E0 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.id AS id,
  list_transform([t_0_V.x], synalog_v -> (CASE WHEN synalog_v IS NULL OR 2 IS NULL THEN NULL WHEN CAST(synalog_v AS DOUBLE) = 0 THEN CAST(synalog_v AS DOUBLE) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 2 >= 0 THEN (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) * POWER(10, 2) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 2)) / POWER(10, 2) + 0 END))[1] AS v
FROM
  t_1_V AS t_0_V ORDER BY id;
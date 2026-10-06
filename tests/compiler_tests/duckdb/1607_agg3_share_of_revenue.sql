-- Initializing DuckDB environment.
create schema if not exists logica_home;
-- Empty record, has to have a field by DuckDB syntax.
drop type if exists logicarecord893574736 cascade; create type logicarecord893574736 as struct(nirvana numeric);
create sequence if not exists eternal_logical_sequence;

WITH t_1_Sale AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'north' AS region,
      'tea' AS item,
      4 AS qty,
      30 AS price
   UNION ALL
  
    SELECT
      2 AS id,
      'north' AS region,
      'coffee' AS item,
      2 AS qty,
      50 AS price
   UNION ALL
  
    SELECT
      3 AS id,
      'south' AS region,
      'tea' AS item,
      6 AS qty,
      30 AS price
   UNION ALL
  
    SELECT
      4 AS id,
      'south' AS region,
      'cake' AS item,
      1 AS qty,
      80 AS price
   UNION ALL
  
    SELECT
      5 AS id,
      'east' AS region,
      'coffee' AS item,
      5 AS qty,
      50 AS price
   UNION ALL
  
    SELECT
      6 AS id,
      'east' AS region,
      'tea' AS item,
      2 AS qty,
      30 AS price
   UNION ALL
  
    SELECT
      7 AS id,
      'north' AS region,
      'cake' AS item,
      3 AS qty,
      80 AS price
   UNION ALL
  
    SELECT
      8 AS id,
      'west' AS region,
      'coffee' AS item,
      4 AS qty,
      50 AS price
   UNION ALL
  
    SELECT
      9 AS id,
      'south' AS region,
      'coffee' AS item,
      3 AS qty,
      50 AS price
   UNION ALL
  
    SELECT
      10 AS id,
      'east' AS region,
      'cake' AS item,
      3 AS qty,
      80 AS price
  
) AS UNUSED_TABLE_NAME  ),
t_0_R AS (SELECT
  Sale.region AS region,
  SUM(((Sale.qty) * (Sale.price))) AS revenue
FROM
  t_1_Sale AS Sale
GROUP BY Sale.region),
t_2_T AS (SELECT
  SUM(t_3_R.revenue) AS total
FROM
  t_0_R AS t_3_R)
SELECT
  R.region AS region,
  list_transform([((100) * (((R.revenue) / NULLIF(T.total, 0))))], synalog_v -> (CASE WHEN synalog_v IS NULL OR 6 IS NULL THEN NULL WHEN CAST(synalog_v AS DOUBLE) = 0 THEN CAST(synalog_v AS DOUBLE) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 6 >= 0 THEN (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) * POWER(10, 6) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 6)) / POWER(10, 6) + 0 END))[1] AS pct
FROM
  t_0_R AS R, t_2_T AS T ORDER BY region, pct;
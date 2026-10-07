DROP TABLE IF EXISTS logica_test.R;
CREATE TABLE logica_test.R AS WITH t_0_Sale AS (SELECT * FROM (
  
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
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Sale.region AS region,
  SUM(((Sale.qty) * (Sale.price))) AS revenue
FROM
  t_0_Sale AS Sale
GROUP BY 1;

-- Interacting with table logica_test.R

WITH t_0_T AS (SELECT
  SUM(t_1_R.revenue) AS total
FROM
  logica_test.R AS t_1_R)
SELECT
  R.region AS region,
  element_at(transform(ARRAY[((100) * ((CAST(R.revenue AS DOUBLE) / NULLIF(T.total, 0))))], synalog_v -> (CASE WHEN synalog_v IS NULL OR 6 IS NULL THEN NULL WHEN CAST(synalog_v AS DOUBLE) = 0 THEN CAST(synalog_v AS DOUBLE) WHEN FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 6 >= 0 THEN (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) / POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0.5) * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14) + 0 ELSE (CASE WHEN CAST(synalog_v AS DOUBLE) < 0 THEN -1 ELSE 1 END) * FLOOR(ABS(CAST(synalog_v AS DOUBLE)) * POWER(10, 6) + 0.5 + 0.5 * POWER(10, FLOOR(LOG10(ABS(CAST(synalog_v AS DOUBLE)))) - 14 + 6)) / POWER(10, 6) + 0 END)), 1) AS pct
FROM
  logica_test.R AS R, t_0_T AS T ORDER BY region, pct;
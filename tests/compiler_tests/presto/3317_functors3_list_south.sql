DROP TABLE IF EXISTS logica_test.R;
CREATE TABLE logica_test.R AS WITH t_0_Sale AS (SELECT * FROM (
  
    SELECT
      1 AS id,
      'north' AS region,
      'tea' AS product,
      120 AS amount
   UNION ALL
  
    SELECT
      2 AS id,
      'north' AS region,
      'cake' AS product,
      40 AS amount
   UNION ALL
  
    SELECT
      3 AS id,
      'south' AS region,
      'tea' AS product,
      75 AS amount
   UNION ALL
  
    SELECT
      4 AS id,
      'south' AS region,
      'coffee' AS product,
      210 AS amount
   UNION ALL
  
    SELECT
      5 AS id,
      'east' AS region,
      'cake' AS product,
      55 AS amount
   UNION ALL
  
    SELECT
      6 AS id,
      'east' AS region,
      'tea' AS product,
      130 AS amount
   UNION ALL
  
    SELECT
      7 AS id,
      'north' AS region,
      'coffee' AS product,
      95 AS amount
   UNION ALL
  
    SELECT
      8 AS id,
      'south' AS region,
      'cake' AS product,
      20 AS amount
  
) AS UNUSED_TABLE_NAME  )
SELECT
  ARRAY_AGG(Sale.amount) AS l
FROM
  t_0_Sale AS Sale
WHERE
  (Sale.region = 'south');

-- Interacting with table logica_test.R

WITH t_1_T AS (SELECT
  SUM(x_4) AS t
FROM
  logica_test.R AS t_2_R, UNNEST(TRANSFORM(t_2_R.l, synalog_e -> ROW(synalog_e))) as pushkin(x_4))
SELECT
  CARDINALITY(R.l) AS n,
  t_0_T.t AS t
FROM
  logica_test.R AS R, t_1_T AS t_0_T;
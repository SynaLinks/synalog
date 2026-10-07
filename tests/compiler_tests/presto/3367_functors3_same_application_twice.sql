DROP TABLE IF EXISTS logica_test.F;
CREATE TABLE logica_test.F AS WITH t_0_Sale AS (SELECT * FROM (
  
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
  Sale.id AS id,
  Sale.amount AS amount
FROM
  t_0_Sale AS Sale
WHERE
  (Sale.product = 'tea');

-- Interacting with table logica_test.F

WITH t_0_R1 AS (SELECT
  SUM(F.amount) AS t
FROM
  logica_test.F AS F),
t_1_R2 AS (SELECT
  SUM(t_2_F.amount) AS t
FROM
  logica_test.F AS t_2_F)
SELECT
  1 AS x
FROM
  t_0_R1 AS R1, t_1_R2 AS R2
WHERE
  (R1.t = R2.t);
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
  (Sale.amount > 100);

-- Interacting with table logica_test.F

SELECT
  F.id AS a,
  t_0_F.id AS b
FROM
  logica_test.F AS F, logica_test.F AS t_0_F
WHERE
  (F.id < t_0_F.id) AND
  (((F.amount) + (t_0_F.amount)) > 200) ORDER BY a, b;
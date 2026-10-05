WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      1 AS k1,
      1 AS k2,
      'x' AS v
   UNION ALL
  
    SELECT
      1 AS k1,
      2 AS k2,
      'y' AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.v AS v
FROM
  t_0_A AS A
WHERE
  (A.k1 = 1) AND
  (A.k2 = 1);
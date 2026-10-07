WITH t_0_A AS (SELECT * FROM (
  
    SELECT
      2 AS k,
      "y" AS v
   UNION ALL
  
    SELECT
      1 AS k,
      "x" AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  A.k AS k,
  A.v AS v
FROM
  t_0_A AS A, UNNEST(ARRAY[1, 2]) as x_6
WHERE
  (A.k = x_6) ORDER BY k LIMIT 1;
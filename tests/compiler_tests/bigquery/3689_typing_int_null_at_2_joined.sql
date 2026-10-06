WITH t_2_K AS (SELECT * FROM (
  
    SELECT
      1 AS k
   UNION ALL
  
    SELECT
      2 AS k
   UNION ALL
  
    SELECT
      3 AS k
  
) AS UNUSED_TABLE_NAME  ),
t_3_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      4 AS v
   UNION ALL
  
    SELECT
      2 AS k,
      7 AS v
   UNION ALL
  
    SELECT
      3 AS k,
      null AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_K.k AS k,
  t_1_V.v AS r
FROM
  t_2_K AS t_0_K, t_3_V AS t_1_V
WHERE
  (t_1_V.k = t_0_K.k) ORDER BY k NULLS LAST;
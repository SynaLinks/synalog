WITH t_2_K AS (SELECT * FROM VALUES
  (1),
  (2),
  (3)
AS UNUSED_TABLE_NAME(k)),
t_3_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS v
   UNION ALL
  
    SELECT
      2 AS k,
      STRUCT(1 AS x, "p" AS y) AS v
   UNION ALL
  
    SELECT
      3 AS k,
      STRUCT(2 AS x, "q" AS y) AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_K.k AS k,
  t_1_V.v.y AS r
FROM
  t_2_K AS t_0_K, t_3_V AS t_1_V
WHERE
  (t_1_V.k = t_0_K.k) ORDER BY k NULLS LAST;
WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY(STRUCT("a" AS n, 1 AS v), STRUCT("b" AS n, 2 AS v)) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY(STRUCT("c" AS n, 3 AS v)) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  (CASE WHEN 0 < 0 THEN NULL ELSE ELEMENT_AT(T.l, CAST(0 AS INT) + 1) END).n AS n
FROM
  t_0_T AS T ORDER BY k NULLS LAST;
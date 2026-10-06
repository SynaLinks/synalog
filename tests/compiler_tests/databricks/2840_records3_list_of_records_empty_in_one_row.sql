WITH t_0_T AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY(STRUCT("a" AS n)) AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY() AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  T.k AS k,
  ARRAY_SIZE(T.l) AS s
FROM
  t_0_T AS T ORDER BY k NULLS LAST;
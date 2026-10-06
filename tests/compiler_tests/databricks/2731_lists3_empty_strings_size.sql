WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      ARRAY("a", "b") AS l
   UNION ALL
  
    SELECT
      2 AS k,
      ARRAY() AS l
   UNION ALL
  
    SELECT
      3 AS k,
      CAST(null AS ARRAY<STRING>) AS l
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k,
  ARRAY_SIZE(S.l) AS n
FROM
  t_0_S AS S ORDER BY k NULLS LAST;
WITH t_0_S AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      STRUCT("a" AS name, ARRAY[1, 2, 3] AS xs) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      STRUCT("b" AS name, ARRAY[4] AS xs) AS r
   UNION ALL
  
    SELECT
      3 AS k,
      STRUCT("c" AS name, ARRAY[] AS xs) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  S.k AS k,
  (CASE WHEN 1 < 0 THEN NULL ELSE S.r.xs[SAFE_OFFSET(1)] END) AS e
FROM
  t_0_S AS S ORDER BY k NULLS LAST;
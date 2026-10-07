WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      STRUCT("x" AS a, 1 AS b) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      STRUCT(null AS a, 2 AS b) AS r
   UNION ALL
  
    SELECT
      3 AS k,
      STRUCT("z" AS a, null AS b) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.k AS k,
  N.r.a AS a
FROM
  t_0_N AS N ORDER BY k;
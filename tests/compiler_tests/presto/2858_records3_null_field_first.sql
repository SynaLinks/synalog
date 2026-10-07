WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(ROW(null, 1) AS ROW(a varchar, b double)) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(ROW('y', 2) AS ROW(a varchar, b double)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.k AS k,
  N.r.a AS a
FROM
  t_0_N AS N ORDER BY k;
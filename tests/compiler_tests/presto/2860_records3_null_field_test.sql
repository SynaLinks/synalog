WITH t_0_N AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(ROW('x', 1) AS ROW(a varchar, b double)) AS r
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(ROW(null, 2) AS ROW(a varchar, b double)) AS r
   UNION ALL
  
    SELECT
      3 AS k,
      CAST(ROW('z', null) AS ROW(a varchar, b double)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  N.k AS k
FROM
  t_0_N AS N
WHERE
  (N.r.a IS null);
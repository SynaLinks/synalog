WITH t_0_Gv AS (SELECT * FROM (
  
    SELECT
      1 AS a,
      null AS b
   UNION ALL
  
    SELECT
      2 AS a,
      5 AS b
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Gv.a AS a,
  GREATEST(Gv.a, Gv.b) AS g,
  LEAST(Gv.a, Gv.b) AS l,
  GREATEST(Gv.a, 2.5, COALESCE(Gv.b, 0)) AS h
FROM
  t_0_Gv AS Gv ORDER BY a;
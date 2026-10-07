WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      CAST(ROW(1, 'p') AS ROW(x double, y varchar)) AS v
   UNION ALL
  
    SELECT
      2 AS k,
      CAST(ROW(2, 'q') AS ROW(x double, y varchar)) AS v
   UNION ALL
  
    SELECT
      3 AS k,
      null AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  t_0_V.v.y AS r
FROM
  t_1_V AS t_0_V ORDER BY k;
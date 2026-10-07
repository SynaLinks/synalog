WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x
   UNION ALL
  
    SELECT
      4 AS x
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x,
  CASE WHEN ((MOD(V.x, NULLIF(2, 0))) = 0) THEN ((V.x) / NULLIF(2, 0)) ELSE null END AS h
FROM
  t_0_V AS V ORDER BY x NULLS LAST;
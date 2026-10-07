WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      null AS s
   UNION ALL
  
    SELECT
      2 AS k,
      "ab" AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.k AS k,
  UPPER(V.s) AS a,
  LENGTH(V.s) AS b,
  SUBSTR(V.s, 1, 1) AS c
FROM
  t_0_V AS V ORDER BY k;
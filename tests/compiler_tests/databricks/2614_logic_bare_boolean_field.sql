WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      STRUCT(false AS ok) AS r
   UNION ALL
  
    SELECT
      2 AS x,
      STRUCT(true AS ok) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  V.r.ok;
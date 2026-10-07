WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      CAST(ROW(false) AS ROW(ok boolean)) AS r
   UNION ALL
  
    SELECT
      2 AS x,
      CAST(ROW(true) AS ROW(ok boolean)) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  V.r.ok;
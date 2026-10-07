WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      JSON_OBJECT('ok', false) AS r
   UNION ALL
  
    SELECT
      2 AS x,
      JSON_OBJECT('ok', true) AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  JSON_EXTRACT(V.r, "$.ok");
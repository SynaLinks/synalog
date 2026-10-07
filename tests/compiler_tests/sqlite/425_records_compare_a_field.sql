WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      JSON_OBJECT('k', 1, 's', 'a') AS r
   UNION ALL
  
    SELECT
      JSON_OBJECT('k', 2, 's', 'b') AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(V.r, "$.s") AS s
FROM
  t_0_V AS V
WHERE
  (JSON_EXTRACT(V.r, "$.k") > 1);
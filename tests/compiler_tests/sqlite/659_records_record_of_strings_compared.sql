WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      JSON_OBJECT('k', 'a', 'v', 'x') AS r
   UNION ALL
  
    SELECT
      JSON_OBJECT('k', 'b', 'v', 'y') AS r
  
) AS UNUSED_TABLE_NAME  )
SELECT
  JSON_EXTRACT(t_0_V.r, "$.v") AS v
FROM
  t_1_V AS t_0_V
WHERE
  (JSON_EXTRACT(t_0_V.r, "$.k") = 'b');
WITH t_0_V AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      true AS b,
      "ab" AS s
   UNION ALL
  
    SELECT
      2 AS x,
      false AS b,
      "ba" AS s
   UNION ALL
  
    SELECT
      3 AS x,
      null AS b,
      null AS s
  
) AS UNUSED_TABLE_NAME  )
SELECT
  V.x AS x
FROM
  t_0_V AS V
WHERE
  V.b AND
  (V.x > 1);
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
  ((SELECT
    MIN(1) AS logica_value
  FROM
    t_0_V AS t_1_V
  WHERE
    t_1_V.b AND
    (t_1_V.x = V.x)) IS NULL) ORDER BY x NULLS LAST;
WITH t_1_V AS (SELECT * FROM (
  
    SELECT
      1 AS k,
      JSON_OBJECT('x', 1, 'y', 'p') AS v
   UNION ALL
  
    SELECT
      2 AS k,
      JSON_OBJECT('x', 2, 'y', 'q') AS v
   UNION ALL
  
    SELECT
      3 AS k,
      null AS v
  
) AS UNUSED_TABLE_NAME  )
SELECT
  t_0_V.k AS k,
  JSON_EXTRACT(t_0_V.v, "$.y") AS r
FROM
  t_1_V AS t_0_V ORDER BY k NULLS LAST;
WITH t_0_Edge AS (SELECT * FROM (
  
    SELECT
      1 AS x,
      2 AS y
   UNION ALL
  
    SELECT
      2 AS x,
      2 AS y
  
) AS UNUSED_TABLE_NAME  )
SELECT
  Edge.x AS x
FROM
  t_0_Edge AS Edge
WHERE
  (Edge.y = Edge.x);
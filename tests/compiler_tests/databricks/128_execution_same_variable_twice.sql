WITH t_0_Edge AS (SELECT * FROM VALUES
  (1, 2),
  (2, 2)
AS UNUSED_TABLE_NAME(x, y))
SELECT
  Edge.x AS x
FROM
  t_0_Edge AS Edge
WHERE
  (Edge.y = Edge.x);
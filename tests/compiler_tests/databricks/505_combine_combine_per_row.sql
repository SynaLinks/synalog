WITH t_1_V AS (SELECT * FROM VALUES
  ("a", 1),
  ("a", 2),
  ("b", 4)
AS UNUSED_TABLE_NAME(g, x)),
t_2_G AS (SELECT
  t_3_V.g AS g
FROM
  t_1_V AS t_3_V
GROUP BY 1)
SELECT
  t_0_G.g AS g,
  (SELECT
  SUM(V.x) AS logica_value
FROM
  t_1_V AS V
WHERE
  (V.g = t_0_G.g)) AS t
FROM
  t_2_G AS t_0_G ORDER BY g NULLS LAST;
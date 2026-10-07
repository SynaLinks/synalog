WITH t_1_L AS (SELECT * FROM VALUES
  (1, ARRAY(1, 2, 3)),
  (2, ARRAY()),
  (3, ARRAY(7)),
  (4, ARRAY(5, 5, 9, 1))
AS UNUSED_TABLE_NAME(k, l))
SELECT
  SUM(x_2) AS s
FROM
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_2) AS pushkin
WHERE
  (t_0_L.k = 4);
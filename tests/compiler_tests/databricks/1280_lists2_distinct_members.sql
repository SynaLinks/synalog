WITH t_1_L AS (SELECT * FROM VALUES
  (1, ARRAY(3, 1, 2)),
  (2, ARRAY()),
  (3, ARRAY(5)),
  (4, ARRAY(7, 7, 8, 9))
AS UNUSED_TABLE_NAME(id, l))
SELECT
  x_2 AS x
FROM
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_2) AS pushkin
GROUP BY 1 ORDER BY x NULLS LAST;

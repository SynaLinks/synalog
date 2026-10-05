WITH t_1_L AS (SELECT * FROM VALUES
  (1, ARRAY(3, 1, 2)),
  (2, ARRAY()),
  (3, ARRAY(5)),
  (4, ARRAY(7, 7, 8, 9))
AS UNUSED_TABLE_NAME(id, l))
SELECT
  t_0_L.id AS id,
  x_4 AS x
FROM
  t_1_L AS t_0_L, LATERAL (SELECT explode(t_0_L.l) AS x_4) AS pushkin ORDER BY id NULLS LAST, x NULLS LAST;
